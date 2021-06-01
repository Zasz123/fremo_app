import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:fremo_app/models/memo.dart';
import 'package:fremo_app/utils/apiHelper.dart';

class MemoProvider with ChangeNotifier {
  bool _checkShowMemo = false;
  Memo _memo;
  bool _isLoading = false;

  bool get checkShowMemo => _checkShowMemo;
  Memo get memo => _memo;
  bool get isLoading => _isLoading;

  set setCheckShowMemo(bool newCheck) {
    this._checkShowMemo = newCheck;
    notifyListeners();
  }

  set setMemo(Memo newMemo) {
    this._memo = newMemo;
    notifyListeners();
  }

  set setIsLoading(bool newIsLoading) {
    this._isLoading = newIsLoading;
    notifyListeners();
  }

  Future<bool> getNewMemo() async {
    try {
      setIsLoading = true;

      final response = await APIHelper.requestGet(path: '/memo');

      final responseData = jsonDecode(response.body);

      final responseMemo = responseData['data']['randomMemo'];
      final Memo newMemo =
          responseMemo != null ? Memo.fromJson(responseMemo) : null;
      final isSuccess = responseData['success'];

      if (!isSuccess) {
        return false;
      }

      setMemo = newMemo;
      setIsLoading = false;
      notifyListeners();

      return true;
    } catch (error) {
      debugPrint(error.toString());
      return false;
    }
  }
}
