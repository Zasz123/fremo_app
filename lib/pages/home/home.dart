import 'package:flutter/material.dart';

import 'package:fremo_app/widgets/common/CustomWidgetWrapper.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 10.0,
      ),
      child: CustomWidgetWrapper(
        child: Text("home"),
      ),
    );
  }
}
