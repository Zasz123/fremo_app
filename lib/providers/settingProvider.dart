import 'package:flutter/foundation.dart';

class SettingProvider with ChangeNotifier {
  bool _isLight;

  SettingProvider({bool isLight}) {
    this._isLight = isLight;
  }

  bool get isLight => this._isLight;

  set isLight(bool isLight) => this._isLight = isLight;
}
