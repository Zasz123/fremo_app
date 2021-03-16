import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:fremo_app/providers/userProvider.dart';
import 'package:fremo_app/widgets/myInfo/myInfoProfile.dart';
import 'package:fremo_app/widgets/myInfo/myInfoForm.dart';
import 'package:fremo_app/widgets/myInfo/myInfoLogin.dart';
import 'package:fremo_app/widgets/common/CustomWidgetWrapper.dart';

class MyInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserProvider _userProvider = Provider.of<UserProvider>(context);

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 10.0,
      ),
      child: CustomWidgetWrapper(
        child: _userProvider.isLoggedIn
            ? Column(
                children: [
                  MyInfoProfile(),
                  SizedBox(
                    height: 30.0,
                  ),
                  MyInfoForm(),
                ],
              )
            : MyInfoLogin(),
      ),
    );
  }
}
