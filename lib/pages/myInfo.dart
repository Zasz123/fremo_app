import 'package:flutter/material.dart';
import 'package:fremo_app/providers/user.dart';

import 'package:fremo_app/widgets/myInfo/myInfoProfile.dart';
import 'package:fremo_app/widgets/myInfo/myInfoForm.dart';
import 'package:fremo_app/widgets/myInfo/myInfoLogin.dart';
import 'package:provider/provider.dart';

class MyInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserProvider _userProvider = Provider.of<UserProvider>(context);

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 10.0,
      ),
      child: _userProvider.isLoggedIn
          ? Column(
              children: [
                MyInfoProfile(),
                SizedBox(
                  height: 50.0,
                ),
                MyInfoForm(),
              ],
            )
          : MyInfoLogin(),
    );
  }
}
