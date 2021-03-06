import 'package:flutter/material.dart';

import 'package:fremo_app/pages/myInfo/normalLogin.dart';
import 'package:fremo_app/pages/myInfo/myInfoRegister.dart';

import 'package:fremo_app/widgets/common/CustomWidgetWrapper.dart';
import 'package:fremo_app/widgets/common/CustomButton.dart';

class MyInfoAuthContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: CustomDefaultButton(
            text: "로그인",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CustomPageRouteWrapper(
                    title: "로그인",
                    child: NormalLogin(),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        SizedBox(
          width: double.infinity,
          child: CustomOutlineButton(
            text: "회원가입",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CustomPageRouteWrapper(
                    title: "회원가입",
                    child: MyInfoRegister(),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        SizedBox(
          width: double.infinity,
          child: CustomDefaultButton(
            text: "구글 로그인(나중에)",
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
