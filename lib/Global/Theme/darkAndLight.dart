import 'package:flutter/material.dart';

class DarkAndLight {
  //
  // 
  //
  //
  // 
  // 
  //
  /////////// Dark Theme
  static ThemeData darkThem = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(Colors.black),
          backgroundColor: WidgetStatePropertyAll(Colors.white)),
    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(color: Colors.white, fontSize: 12.5),
      titleSmall: TextStyle(color: Colors.white, fontSize: 14),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  );
  //
  //
  //
  // 
  // 
  // 
  //
  ///////// Light Theme
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(Colors.white),
          backgroundColor: WidgetStatePropertyAll(Colors.black)),
    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(color: Colors.black, fontSize: 12.5),
      titleSmall: TextStyle(color: Colors.black, fontSize: 14),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
    ),
    iconTheme: const IconThemeData(color: Colors.black),
  );
}
