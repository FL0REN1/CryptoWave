import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  // [TEXT]

  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      color: Colors.white,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w700,
      fontSize: 32,
    ),
    titleLarge: TextStyle(
      color: Colors.white,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w700,
      fontSize: 24,
    ),
    labelSmall: TextStyle(
      color: Colors.white,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
      fontSize: 14,
    ),
  ),

  // [BUTTON]
  outlinedButtonTheme: const OutlinedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStatePropertyAll(
        EdgeInsets.symmetric(vertical: 20, horizontal: 100),
      ),
      backgroundColor: MaterialStatePropertyAll(Color(0xFF41b3cc)),
      foregroundColor: MaterialStatePropertyAll(Colors.white),
      textStyle: MaterialStatePropertyAll(
        TextStyle(
          color: Colors.white,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w700,
          fontSize: 17,
        ),
      ),
      overlayColor: MaterialStatePropertyAll(Color.fromARGB(255, 47, 131, 150)),
    ),
  ),

  // [DECORATION]
  scaffoldBackgroundColor: const Color.fromARGB(108, 78, 78, 78),
  dividerColor: Colors.white,
);
