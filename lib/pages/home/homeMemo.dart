import 'package:flutter/material.dart';

import 'package:fremo_app/widgets/home/memoContainer.dart';

class HomeMemoPage extends StatefulWidget {
  @override
  _HomeMemoPageState createState() => _HomeMemoPageState();
}

class _HomeMemoPageState extends State<HomeMemoPage> {
  TextEditingController commentController;

  @override
  void initState() {
    super.initState();

    commentController = new TextEditingController();
  }

  void onCommentSubmit() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MemoContainer(
        commentController: commentController,
        onCommentSubmit: onCommentSubmit,
      ),
    );
  }
}
