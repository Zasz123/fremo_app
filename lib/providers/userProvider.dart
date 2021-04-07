import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:fremo_app/utils/apiHelper.dart';
import 'package:fremo_app/utils/secureStorage.dart';

import 'package:fremo_app/models/user.dart';

class UserProvider with ChangeNotifier {
  String _token;
  User _user;

  UserProvider([User user, String newToken]) {
    this._user = user ?? null;
    this._token = newToken ?? null;
  }

  User get user => this._user;
  String get token => this._token;

  set user(User newUser) {
    this._user = newUser;
    notifyListeners();
  }

  set token(String newToken) {
    this._token = newToken;
    notifyListeners();
  }

  Future<bool> login(
    String email,
    String password,
  ) async {
    try {
      User accountInfo = new User(
        email: email,
        password: password,
      );

      final response = await APIHelper.requestPost(
        path: "/user/login",
        body: accountInfo.toMap(),
      );

      final responseData = jsonDecode(response.body);

      final newToken = responseData['data']['token'];
      final isSuccess = responseData['success'];

      if (!isSuccess) {
        return false;
      }

      await SecureStorageUtil.setData("token", newToken);
      token = newToken;

      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool> register(
    String email,
    String password,
    String nickName,
  ) async {
    try {
      User newUser = new User(
        email: email,
        nickName: nickName,
        password: password,
      );

      final response = await APIHelper.requestPost(
        path: "/user",
        body: newUser.toMap(),
      );

      final responseData = jsonDecode(response.body);

      final newToken = responseData['data']['token'];
      final isSuccess = responseData['success'];

      if (isSuccess) {
        return false;
      }

      await SecureStorageUtil.setData(
        "token",
        newToken,
      );

      token = newToken;

      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  void logout() {
    this._token = null;
    this._user = null;

    notifyListeners();
  }
}
