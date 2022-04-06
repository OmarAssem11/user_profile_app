import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xffDF3155),
    onPrimary: Colors.black,
    secondary: Color.fromARGB(255, 240, 240, 240),
    onSecondary: Colors.black,
    error: Colors.black,
    onError: Colors.black,
    background: Colors.black,
    onBackground: Colors.black,
    surface: Colors.black,
    onSurface: Colors.black,
  ),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      fontSize: 22,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    elevation: 0,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: MaterialStateProperty.all(const Color(0xffDF3155)),
      foregroundColor: MaterialStateProperty.all(Colors.white),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      foregroundColor: MaterialStateProperty.all(const Color(0xffDF3155)),
    ),
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: 32,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    headline3: TextStyle(
      fontSize: 24,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  ),
);
