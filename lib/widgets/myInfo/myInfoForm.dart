import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fremo_app/providers/userProvider.dart';

import 'package:fremo_app/widgets/common/CustomFormWidget.dart';
import 'package:fremo_app/widgets/common/CustomButton.dart';

class MyInfoForm extends StatefulWidget {
  @override
  _MyInfoFormState createState() => _MyInfoFormState();
}

class _MyInfoFormState extends State<MyInfoForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    UserProvider _userProvider = Provider.of<UserProvider>(context);
    String _email = _userProvider.user == null ? "" : _userProvider.user.email;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomInput(
            readOnly: true,
            initialValue: _email,
            placeholder: "이메일",
            validatorFunction: (value) {
              if (value.isEmpty) {
                return '이메일이 비었습니다.';
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          CustomInput(
            placeholder: "아이디",
            validatorFunction: (value) {
              if (value.isEmpty) {
                return '아이디가 비었습니다.';
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          CustomInput(
            placeholder: "이름",
            validatorFunction: (value) {
              if (value.isEmpty) {
                return '이름이 비었습니다.';
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: 15.0,
          ),
          CustomDefaultButton(
            child: Text(
              "수정",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text("data is valid!"),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
