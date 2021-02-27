import 'package:flutter/cupertino.dart';

class UserProvider with ChangeNotifier {
  String _token;

  UserProvider([String token]) {
    this._token = token ?? null;
  }

  String getToken() => this._token;

  void setToken(String newToken) {
    this._token = newToken;
    notifyListeners();
  }
}
