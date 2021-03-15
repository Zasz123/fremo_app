import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fremo_app/providers/memoProvider.dart';
import 'package:fremo_app/widgets/common/CustomButton.dart';

class HomeLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: <Widget>[
              Text(
                "오늘 하루는 어떠셨나요?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "모든 국민은 통신의 비밀을 침해받지 아니한다. 행정각부의 설치·조직과 직무범위는 법률로 정한다. 국회의원의 수는 법률로 정하되, 200인 이상으로 한다.",
                style: TextStyle(
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          CustomDefaultButton(
            text: "메모 확인하기",
            onPressed: () {
              context.read<MemoProvider>().setCheckShowMemo = true;
            },
          )
        ],
      ),
    );
  }
}
