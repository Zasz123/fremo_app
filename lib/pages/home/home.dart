import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fremo_app/providers/memoProvider.dart';

import 'package:fremo_app/pages/home/homeLanding.dart';
import 'package:fremo_app/pages/home/homeArticle.dart';

import 'package:fremo_app/widgets/common/CustomWidgetWrapper.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MemoProvider memoProvider = context.watch<MemoProvider>();

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 10.0,
      ),
      child: CustomWidgetWrapper(
        child:
            memoProvider.checkShowMemo ? HomeArticlePage() : HomeLandingPage(),
      ),
    );
  }
}
