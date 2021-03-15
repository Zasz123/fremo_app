import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:fremo_app/providers/userProvider.dart';
import 'package:fremo_app/utils/googleAuth.dart';
import 'package:provider/provider.dart';
import 'package:fremo_app/utils/toast.dart';

class MyInfoLogin extends StatelessWidget {
  final overlayEntry = OverlayEntry(builder: (BuildContext context) {
    return Positioned(
      top: 0.0,
      left: 0.0,
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: CircularProgressIndicator(),
      ),
    );
  });

  Future<void> userLogin(BuildContext context) async {
    Overlay.of(context).insert(overlayEntry);

    try {
      User user = await googleLogin();
      context.read<UserProvider>().user = user;
    } on PlatformException catch (_) {
      await displayToast("로그인에 실패했습니다.");
    } catch (_) {
      await displayToast("로그인에 실패했습니다.");
    } finally {
      overlayEntry.remove();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Fremo!"),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            child: Text("구글에 로그인"),
            onPressed: () async {
              await userLogin(context);
            },
          ),
        )
      ],
    );
  }
}
