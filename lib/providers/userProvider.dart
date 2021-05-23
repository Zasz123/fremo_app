import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:fremo_app/utils/apiHelper.dart';
import 'package:fremo_app/utils/secureStorage.dart';

import 'package:fremo_app/models/user.dart';

class UserProvider with ChangeNotifier {
  String _token;
  User _user;
  bool _isLoggedIn;

  UserProvider([User user, String newToken, bool isLoggedIn]) {
    this._user = user ?? null;
    this._token = newToken ?? null;
    this._isLoggedIn = isLoggedIn ?? false;
  }

  User get user => this._user;
  String get token => this._token;
  bool get isLoggedIn => this._isLoggedIn;

  set user(User newUser) {
    this._user = newUser;
    notifyListeners();
  }

  set token(String newToken) {
    this._token = newToken;
    notifyListeners();
  }

  set isLoggedIn(bool newIsLoggedIn) {
    this._isLoggedIn = newIsLoggedIn;
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
      final loggedInUserInfo = responseData['data']['user'];
      final isSuccess = responseData['success'];

      if (!isSuccess) {
        return false;
      }

      await SecureStorageUtil.setData("token", newToken);
      token = newToken;
      user = User.fromJson(loggedInUserInfo);
      isLoggedIn = true;

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
      final createdUserInfo = responseData['data']['user'];
      final isSuccess = responseData['success'];

      if (!isSuccess) {
        return false;
      }

      await SecureStorageUtil.setData(
        "token",
        newToken,
      );
      token = newToken;
      user = User.fromJson(createdUserInfo);
      isLoggedIn = true;

      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool> update(String newEmail, String newNickName) async {
    try {
      User newUser = User(
        email: newEmail,
        nickName: newNickName,
      );

      final response = await APIHelper.requestPatch(
        path: '/user',
        body: newUser.toMap(),
      );

      final responseData = jsonDecode(response.body);

      final isSuccess = responseData['success'];

      if (!isSuccess) {
        return false;
      }

      user = User(
        id: user.id,
        email: newEmail,
        nickName: newNickName,
        password: user.password,
      );

      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool> setUserInfo(String savedToken) async {
    try {
      final response = await APIHelper.requestGet(
        path: "/user",
      );

      final responseData = jsonDecode(response.body);

      final isSuccess = responseData['success'];
      final userData = responseData['data'];

      if (!isSuccess) {
        return false;
      }

      user = User.fromJson(userData);
      token = savedToken;
      isLoggedIn = true;

      notifyListeners();

      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<void> logout() async {
    this._token = null;
    this._user = null;
    this._isLoggedIn = false;

    SecureStorageUtil.deleteData('token');

    notifyListeners();
  }
}
