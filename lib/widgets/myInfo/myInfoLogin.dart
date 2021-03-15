import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fremo_app/providers/userProvider.dart';

import 'package:fremo_app/utils/googleAuth.dart';
import 'package:provider/provider.dart';

class MyInfoLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserProvider _userProvider = Provider.of<UserProvider>(context);

    return Column(
      children: [
        Text("Fremo!"),
        SizedBox(
          width: double.infinity,
          child: RaisedButton(
            child: Text("구글에 로그인"),
            onPressed: () async {
              User user = await googleLogin();
              _userProvider.user = user;
            },
          ),
        )
      ],
    );
  }
}
