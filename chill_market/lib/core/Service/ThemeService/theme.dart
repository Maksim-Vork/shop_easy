import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Color(0xFF595959),
  useMaterial3: true,
  colorScheme: ColorScheme.light(
    primary: Color(0xFFE95454),
    onPrimary: Colors.white,

    secondary: Color(0xFF4B4B4B),
    onSecondary: Color(0xFFAEAEAE),

    surface: Color(0xFF595959),
    onSurface: Color(0xFFDADADA),

    onError: Color(0xFFFF5858),
  ),
);
