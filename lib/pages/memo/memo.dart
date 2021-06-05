import 'package:flutter/material.dart';
import 'package:fremo_app/utils/toast.dart';
import 'package:fremo_app/widgets/memo/comment.dart';
import 'package:provider/provider.dart';

import 'package:fremo_app/models/memo.dart';
import 'package:fremo_app/providers/memoProvider.dart';
import 'package:fremo_app/providers/commentProvider.dart';

class MemoPage extends StatefulWidget {
  @override
  _MemoPageState createState() => _MemoPageState();
}

class _MemoPageState extends State<MemoPage> {
  TextEditingController commentController;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    commentController = new TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await context.read<MemoProvider>().getNewMemo();
    });
  }

  @override
  void dispose() {
    super.dispose();

    commentController.dispose();
  }

  Future<void> onCommentSubmit(int memoId, String commentBody) async {
    setState(() {
      isLoading = true;
    });

    CommentProvider commentProvider = context.read<CommentProvider>();

    final isSuccess = await commentProvider.wrtierComment(memoId, commentBody);

    if (!isSuccess) {
      displayToast("한 마디 남기기 에러!");
    }

    setState(() {
      isLoading = false;
      commentController.clear();
    });

    await context.read<MemoProvider>().getNewMemo();
  }

  @override
  Widget build(BuildContext context) {
    MemoProvider memoProvider = context.watch<MemoProvider>();
    Memo nowMemo = memoProvider.memo;
    TextTheme textTheme = Theme.of(context).textTheme;

    return memoProvider.isLoading || nowMemo == null
        ? Text("로딩중")
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nowMemo.title,
                style: textTheme.headline5,
              ),
              SizedBox(height: 20.0),
              Container(
                child: Text(
                  nowMemo.body,
                  style: textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              MemoComment(
                commentController: commentController,
                onCommentSubmit: onCommentSubmit,
              ),
            ],
          );
  }
}
