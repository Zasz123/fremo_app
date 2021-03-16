import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:fremo_app/providers/userProvider.dart';
import 'package:fremo_app/utils/googleAuth.dart';
import 'package:provider/provider.dart';
import 'package:fremo_app/utils/toast.dart';

class MyInfoLogin extends StatelessWidget {
  final OverlayEntry overlayEntry = OverlayEntry(
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
        ),
        width: 20.0,
        height: 20.0,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    },
  );

  Future<bool> userLogin(BuildContext context) async {
    Overlay.of(context).insert(overlayEntry);

    try {
      User user = await googleLogin();
      context.read<UserProvider>().user = user;

      return true;
    } on PlatformException catch (_) {
      return false;
    } catch (_) {
      return false;
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
              if (!await userLogin(context)) {
                await displayToast("로그인에 실패했습니다.");
              }
            },
          ),
        )
      ],
    );
  }
}
