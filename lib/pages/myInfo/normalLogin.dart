import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fremo_app/providers/userProvider.dart';

import 'package:fremo_app/widgets/common/CustomButton.dart';
import 'package:fremo_app/widgets/common/CustomFormWidget.dart';

import 'package:fremo_app/utils/toast.dart';

class NormalLogin extends StatefulWidget {
  @override
  _NormalLoginState createState() => _NormalLoginState();
}

class _NormalLoginState extends State<NormalLogin> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = context.read<UserProvider>();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomInput(
            placeholder: "이메일",
            controller: emailController,
            validatorFunction: (String text) {
              if (text.isEmpty) {
                return "이메일을 입력해주세요.";
              }

              return null;
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          CustomInput(
            placeholder: "비밀번호",
            isPassword: true,
            controller: passwordController,
            validatorFunction: (String text) {
              if (text.isEmpty) {
                return "비밀번호를 입력해주세요.";
              }

              return null;
            },
          ),
          SizedBox(
            height: 15.0,
          ),
          CustomDefaultButton(
            child: Text("로그인"),
            onPressed: () async {
              if (!_formKey.currentState.validate()) {
                return;
              }

              final loginResult = await userProvider.login(
                  emailController.text, passwordController.text);

              if (loginResult) {
                displayToast("로그인에 성공하셨습니다.");
                Navigator.pop(context);

                return;
              }
              displayToast("로그인에 실패하셨습니다.");
            },
          )
        ],
      ),
    );
  }
}
