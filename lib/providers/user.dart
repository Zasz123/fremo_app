import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProvider with ChangeNotifier {
  User _user;
  bool _isLoggedIn = false;

  UserProvider([User user]) {
    this._user = user ?? null;
  }

  User get user => this._user;
  bool get isLoggedIn => this._isLoggedIn;

  set user(User newUser) {
    this._user = newUser;
    this._isLoggedIn = newUser == null ? false : true;
    notifyListeners();
  }
}
