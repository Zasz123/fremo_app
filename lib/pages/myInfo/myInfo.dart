import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fremo_app/providers/userProvider.dart';

import 'package:fremo_app/pages/myInfo/myInfoAuthContainer.dart';

import 'package:fremo_app/widgets/common/CustomWidgetWrapper.dart';

class MyInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = context.watch<UserProvider>();

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 10.0,
      ),
      child: CustomWidgetWrapper(
        child: userProvider.token != null
            ? Column(
                children: [
                  Text("로그인 됨"),
                  InkWell(
                    child: Text("로그아웃"),
                    onTap: () {
                      userProvider.logout();
                    },
                  )
                ],
              )
            : MyInfoAuthContainer(),
      ),
    );
  }
}
