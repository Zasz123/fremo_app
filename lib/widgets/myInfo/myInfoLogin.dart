import 'package:flutter/material.dart';

class MyInfoLogin extends StatelessWidget {
  final Function(BuildContext context) userLogin;

  MyInfoLogin({@required this.userLogin});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Fremo!"),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            child: Text("구글에 로그인"),
            onPressed: () {
              userLogin(context);
            },
          ),
        )
      ],
    );
  }
}
