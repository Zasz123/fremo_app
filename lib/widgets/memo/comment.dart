import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/memoProvider.dart';
import '../../providers/userProvider.dart';
import '../../providers/userProvider.dart';
import '../common/CustomButton.dart';
import '../common/CustomFormWidget.dart';

class MemoComment extends StatelessWidget {
  const MemoComment({
    Key key,
    @required this.commentController,
    @required this.onCommentSubmit,
  }) : super(key: key);

  final TextEditingController commentController;
  final Future Function(
    int memoId,
    String body,
  ) onCommentSubmit;

  @override
  Widget build(BuildContext context) {
    MemoProvider memoProvider = context.watch<MemoProvider>();
    UserProvider userProvider = context.watch<UserProvider>();

    return userProvider.isLoggedIn
        ? Column(
            children: [
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
          )
        : Column(
            children: [
              Divider(
                color: Colors.black.withOpacity(0.5),
                thickness: 0.5,
              ),
              SizedBox(height: 10.0),
              Text(
                "로그인해서 따듯한 한마디를 남겨주세요.",
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ],
          );
  }
}
