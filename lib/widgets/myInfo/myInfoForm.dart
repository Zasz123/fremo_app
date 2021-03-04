import 'package:flutter/material.dart';
import 'package:fremo_app/providers/user.dart';

import 'package:fremo_app/widgets/common/CustomFormWidget.dart';
import 'package:provider/provider.dart';

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

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
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
              height: 10.0,
            ),
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
              height: 15.0,
            ),
            SizedBox(
              height: 40.0,
              width: double.infinity,
              child: RaisedButton(
                elevation: 0,
                color: Color(0xff95C7AE),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
