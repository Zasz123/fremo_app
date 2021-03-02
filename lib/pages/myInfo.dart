import 'package:flutter/material.dart';
import 'package:fremo_app/utils/googleAuth.dart';

class MyInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
        child: Column(
          children: [
            RaisedButton(
              child: Text("구글 로그인"),
              onPressed: () async {
                await googleLogin();
              },
            ),
            RaisedButton(
              child: Text("로그아웃"),
              onPressed: () async {
                await googleLogout();
              },
            )
          ],
        )
        // child: MyInfoProfile(),
        );
  }
}
