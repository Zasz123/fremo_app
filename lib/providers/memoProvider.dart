import 'package:flutter/cupertino.dart';

import 'package:fremo_app/models/memo.dart';

class MemoProvider with ChangeNotifier {
  bool _checkShowMemo = false;
  Memo _memo;

  bool get checkShowMemo => _checkShowMemo;
  Memo get memo => _memo;

  set setCheckShowMemo(bool newCheck) {
    this._checkShowMemo = newCheck;
    notifyListeners();
  }

  set setMemo(Memo newMemo) {
    this._memo = newMemo;
    notifyListeners();
  }
}
