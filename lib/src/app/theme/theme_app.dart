import 'package:flutter/material.dart';

class ThemeApp {
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF6F61DD),
      elevation: 0.5,
    ),
    focusColor: const Color(0xFF6F61DD),
    indicatorColor: const Color(0xFF493D9F),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: MaterialStateColor.resolveWith(
        (states) => const Color(0x553F43AB),
      ),
    ),
    primaryColor: const Color(0xFF483D9F),
    scaffoldBackgroundColor: const Color(0xFFF2F2FA),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: const Color(0xFFAC99CA),
      background: const Color.fromARGB(255, 252, 252, 255),
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 127, 110, 255),
      elevation: 0.5,
    ),
    focusColor: const Color.fromARGB(255, 187, 178, 255),
    indicatorColor: const Color.fromARGB(255, 187, 178, 255),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: MaterialStateColor.resolveWith(
        (states) => const Color.fromARGB(156, 187, 178, 255),
      ),
    ),
    primaryColor: const Color.fromARGB(208, 143, 128, 255),
    scaffoldBackgroundColor: const Color.fromARGB(255, 64, 64, 64),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: const Color(0xFFAC99CA),
      background: const Color.fromARGB(255, 54, 54, 54),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
    ),
  );
}
