import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProvider with ChangeNotifier {
  User _user;

  UserProvider([User user]) {
    this._user = user ?? null;
  }

  User getUser() => this._user;

  void setUser(User newUser) {
    this._user = newUser;
    notifyListeners();
  }
}
