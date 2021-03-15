import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fremo_app/providers/memoProvider.dart';

class HomeArticlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("dsa"),
          RaisedButton(
            child: Text("되돌리기"),
            onPressed: () {
              context.read<MemoProvider>().setCheckShowMemo = false;
            },
          ),
        ],
      ),
    );
  }
}
