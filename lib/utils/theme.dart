import 'package:flutter/material.dart';

ThemeData getThemeData(bool isLight) {
  if (isLight) {
    return lightTheme;
  } else {
    return darkTheme;
  }
}

ThemeData lightTheme = ThemeData(
  primaryColor: const Color(0xff95C7AE),
  brightness: Brightness.light,
);

ThemeData darkTheme = ThemeData(
  primaryColor: const Color(0xff95C7AE),
  brightness: Brightness.dark,
);
