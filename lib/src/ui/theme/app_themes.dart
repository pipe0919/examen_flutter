import 'package:flutter/material.dart';

import '../colors/colors.dart';
import '../responsive/Adapt.dart';

class AppThemes {
  static final ThemeData themeData = _themeData();

  static ThemeData _themeData() {
    return ThemeData(
      primarySwatch: Colors.green,
      appBarTheme: AppBarTheme(
        color: ColorsApp.appColor,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: Adapt.px(24),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
