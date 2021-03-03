import 'package:flutter/material.dart';

import 'package:fremo_app/widgets/myInfo/myInfoProfile.dart';
import 'package:fremo_app/widgets/myInfo/myInfoForm.dart';

class MyInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
      child: Column(
        children: [
          MyInfoProfile(),
          SizedBox(
            height: 20.0,
          ),
          MyInfoForm(),
        ],
      ),
    );
  }
}

// Column(
//           children: [
//             Text(_userInfo == null ? "로그인 해주세요." : _userInfo.displayName),
//             _userInfo == null
//                 ? RaisedButton(
//                     child: Text("구글 로그인"),
//                     onPressed: () async {
//                       User loggedInUser = await googleLogin();
//                       _userProvider.setUser(loggedInUser);
//                     },
//                   )
//                 : RaisedButton(
//                     child: Text("로그아웃"),
//                     onPressed: () async {
//                       await googleLogout();
//                       _userProvider.setUser(null);
//                     },
//                   ),
//           ],
//         )
