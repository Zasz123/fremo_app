import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

import 'package:firebase_auth/firebase_auth.dart';

class ApiProvider extends ChangeNotifier {
  User _user;

  ApiProvider([User user]) {
    this._user = user ?? null;
  }

  set setUser(User newUser) {
    this._user = newUser;
    notifyListeners();
  }

  void login() {
    //request login
  }

  void register() {
    //requrest register
  }
}
