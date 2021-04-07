import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fremo_app/providers/userProvider.dart';

import 'package:fremo_app/widgets/common/CustomFormWidget.dart';
import 'package:fremo_app/widgets/common/CustomButton.dart';

import 'package:fremo_app/utils/toast.dart';

class MyInfoRegister extends StatefulWidget {
  @override
  _MyInfoRegisterState createState() => _MyInfoRegisterState();
}

class _MyInfoRegisterState extends State<MyInfoRegister> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nickNameController = TextEditingController();

  Future<void> onRegister() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    final bool registerResult = await context.read<UserProvider>().register(
          emailController.text,
          passwordController.text,
          nickNameController.text,
        );
    print(registerResult);

    if (registerResult) {
      displayToast("회원가입에 성공하셨습니다!");
      Navigator.pop(context);

      return;
    }
    displayToast("회원가입에 실패하셨습니다.");
  }

  @override
  Widget build(BuildContext context) {
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
            height: 10.0,
          ),
          CustomInput(
            placeholder: "닉네임",
            controller: nickNameController,
            validatorFunction: (String text) {
              if (text.isEmpty) {
                return "닉네임을 입력해주세요.";
              }

              return null;
            },
          ),
          SizedBox(
            height: 15.0,
          ),
          CustomDefaultButton(
            text: "회원가입",
            fullWidth: true,
            onPressed: onRegister,
          ),
        ],
      ),
    );
  }
}
