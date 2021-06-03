import 'package:flutter/material.dart';
import 'package:fremo_app/utils/toast.dart';
import 'package:provider/provider.dart';

import 'package:fremo_app/models/memo.dart';
import 'package:fremo_app/providers/memoProvider.dart';
import 'package:fremo_app/providers/commentProvider.dart';

import 'package:fremo_app/widgets/common/CustomFormWidget.dart';
import 'package:fremo_app/widgets/common/CustomButton.dart';

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
    });

    await context.read<MemoProvider>().getNewMemo();
  }

  @override
  Widget build(BuildContext context) {
    MemoProvider memoProvider = context.watch<MemoProvider>();
    Memo nowMemo = memoProvider.memo;

    return memoProvider.isLoading || nowMemo == null
        ? Text("로딩중")
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nowMemo.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                child: Text(
                  nowMemo.body,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              CustomInput(
                isMultiline: true,
                controller: commentController,
                placeholder: "따듯한 한마디를 남겨주세요.",
              ),
              SizedBox(
                height: 10.0,
              ),
              CustomDefaultButton(
                text: "한마디",
                onPressed: () => onCommentSubmit(
                  memoProvider.memo.id,
                  commentController.text,
                ),
              ),
            ],
          );
  }
}
