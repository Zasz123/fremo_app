import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fremo_app/providers/memoProvider.dart';

import 'package:fremo_app/pages/home/homeLanding.dart';
import 'package:fremo_app/pages/memo/memo.dart';

import 'package:fremo_app/widgets/common/CustomWidgetWrapper.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MemoProvider memoProvider = context.watch<MemoProvider>();

    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
        top: 10.0,
        bottom: 30.0,
      ),
      child: CustomWidgetWrapper(
        child: memoProvider.checkShowMemo ? MemoPage() : HomeLandingPage(),
      ),
    );
  }
}
