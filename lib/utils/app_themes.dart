import 'package:flutter/material.dart';

class AppThemes {
  //Light Theme
  static final light = ThemeData(
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 79, 151, 81),
      primary: const Color.fromARGB(255, 49, 107, 51),
      brightness: Brightness.light,
      surface: Colors.white,
    ),
    cardColor: Colors.white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: const Color.fromARGB(255, 76, 197, 80),
      unselectedItemColor: Colors.grey,
    ),
  );

  //Dark Theme
  static final dark = ThemeData(
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Color(0xFF121212),
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF121212),
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 79, 151, 81),
      primary: const Color.fromARGB(255, 49, 107, 51),
      brightness: Brightness.dark,
      surface: Color(0xFF121212),
    ),
    cardColor: Color(0xFF1E1E1E),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF1E1E1E),
      selectedItemColor: const Color.fromARGB(255, 76, 197, 80),
      unselectedItemColor: Colors.grey,
    ),
  );
}
