import 'package:flutter/material.dart';
import 'package:fremo_app/widgets/common/CustomButton.dart';
import 'package:fremo_app/widgets/common/CustomFormWidget.dart';
import 'package:provider/provider.dart';

import 'package:fremo_app/providers/userProvider.dart';

import 'package:fremo_app/models/user.dart';

class MyInfoDetailContainer extends StatefulWidget {
  @override
  _MyInfoDetailContainerState createState() => _MyInfoDetailContainerState();
}

class _MyInfoDetailContainerState extends State<MyInfoDetailContainer> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _nickNameController = TextEditingController();

  Future<bool> onUpdateInfo() async {
    UserProvider userProvider = context.read<UserProvider>();
    final user = userProvider.user;

    userProvider.user = User(
      id: user.id,
      email: _emailController.text,
      nickName: _nickNameController.text,
    );

    final updateResult = await userProvider.update(
      _emailController.text,
      _nickNameController.text,
    );

    return updateResult;
  }

  @override
  void initState() {
    super.initState();

    if (mounted) {
      User user = context.read<UserProvider>().user;

      _emailController.text = user.email;
      _nickNameController.text = user.nickName;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: RawMaterialButton(
              onPressed: () {
                // image change event code
                print("image change event");
              },
              child: ClipOval(
                child: Image.network(
                  'https://blog.kakaocdn.net/dn/nhm3d/btqB11oGTif/3Gtf5FIczSo3kL0h4lAXQ0/img.jpg',
                  height: 150.0,
                  width: 150.0,
                  fit: BoxFit.cover,
                ),
              ),
              shape: CircleBorder(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomInput(
                  controller: this._emailController,
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
                  controller: this._nickNameController,
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
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      final updateResult = await onUpdateInfo();
                      String message = "정보 수정 완료!";

                      if (!updateResult) {
                        message = "정보 수정 실패.";
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(message),
                        ),
                      );
                    }
                  },
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 20.0,
                    child: InkWell(
                      onTap: () {
                        context.read<UserProvider>().logout();
                      },
                      child: Text(
                        "로그아웃",
                        style: TextStyle(
                          color: Colors.grey[400],
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
