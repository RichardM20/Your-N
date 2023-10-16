import 'package:flutter/material.dart';

class ThemeApp {
  static final ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 111, 97, 221),
    ),
    focusColor: const Color.fromARGB(255, 111, 97, 221),
    indicatorColor: const Color.fromARGB(155, 73, 61, 159),
    scrollbarTheme: ScrollbarThemeData(
        thumbColor: MaterialStateColor.resolveWith(
      (states) => const Color.fromARGB(85, 63, 67, 171),
    )),
    primaryColor: const Color.fromARGB(255, 72, 61, 159),
    scaffoldBackgroundColor: const Color(0xFFF2F2FA),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: const Color(0xFFAC99CA),
      background: const Color(0xFFF2F2FA),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: const Color.fromARGB(255, 72, 61, 159),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: const Color(0xFFAC99CA),
      background: const Color(0xFFF2F2FA),
    ),
  );
}
