import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fremo_app/utils/apiHelper.dart';
import 'package:fremo_app/models/comment.dart';

class CommentProvider with ChangeNotifier {
  Future<bool> wrtierComment(int memoId, String commentBody) async {
    try {
      final Map<String, dynamic> body = {
        'body': commentBody,
        'memoId': memoId,
      };

      final response = await APIHelper.requestPost(
        path: "/comment",
        body: body,
      );

      final responseData = jsonDecode(response.body);

      final isSuccess = responseData['success'];

      if (!isSuccess) {
        final error = responseData['error'];

        debugPrint("${error['name']}[${error['code']}]: ${error['message']}");

        return false;
      }

      return true;
    } catch (error) {
      debugPrint(error);
      return false;
    }
  }
}
