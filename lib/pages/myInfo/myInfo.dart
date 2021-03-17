import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fremo_app/utils/googleAuth.dart';
import 'package:fremo_app/utils/overlay.dart';
import 'package:fremo_app/utils/toast.dart';

import 'package:provider/provider.dart';

import 'package:fremo_app/providers/userProvider.dart';
import 'package:fremo_app/widgets/myInfo/myInfoProfile.dart';
import 'package:fremo_app/widgets/myInfo/myInfoForm.dart';
import 'package:fremo_app/widgets/myInfo/myInfoLogin.dart';
import 'package:fremo_app/widgets/common/CustomWidgetWrapper.dart';

class MyInfoScreen extends StatelessWidget {
  Future<void> userLogout(BuildContext context) async {
    Overlay.of(context).insert(loadingOverlayEntry);

    try {
      await FirebaseAuth.instance.signOut();
      context.read<UserProvider>().user = null;
    } on PlatformException catch (e) {
      debugPrint(e.toString());
      displayToast("로그아웃에 실패했습니다.");
    } catch (e) {
      debugPrint(e.toString());
      displayToast("로그아웃에 실패했습니다.");
    } finally {
      loadingOverlayEntry.remove();
    }
  }

  Future<void> userLogin(BuildContext context) async {
    Overlay.of(context).insert(loadingOverlayEntry);

    try {
      User user = await googleLogin();
      context.read<UserProvider>().user = user;
    } on PlatformException catch (e) {
      debugPrint(e.toString());
      displayToast("로그아웃에 실패했습니다.");
    } catch (e) {
      debugPrint(e.toString());
      displayToast("로그아웃에 실패했습니다.");
    } finally {
      loadingOverlayEntry.remove();
    }
  }

  @override
  Widget build(BuildContext context) {
    UserProvider _userProvider = Provider.of<UserProvider>(context);

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 10.0,
      ),
      child: CustomWidgetWrapper(
        child: _userProvider.isLoggedIn
            ? Column(
                children: [
                  MyInfoProfile(),
                  SizedBox(
                    height: 30.0,
                  ),
                  MyInfoForm(
                    userLogout: userLogout,
                  ),
                ],
              )
            : MyInfoLogin(
                userLogin: userLogin,
              ),
      ),
    );
  }
}
