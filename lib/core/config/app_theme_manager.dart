import 'package:flutter/material.dart';

class AppThemeManager {
  static const Color primaryColor = Color(0xFF004182);
  static const TextStyle text14 = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Color(0xFF06004F));
  static ThemeData appTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
  );
}
