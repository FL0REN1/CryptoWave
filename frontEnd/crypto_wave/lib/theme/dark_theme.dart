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
      fontSize: 28,
    ),
    labelSmall: TextStyle(
      color: Colors.white,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
      fontSize: 13,
    ),
    labelMedium: TextStyle(
      color: Colors.white,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w700,
      fontSize: 20,
    ),
    bodySmall: TextStyle(
      color: Color.fromARGB(179, 255, 255, 255),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      color: Color.fromARGB(179, 255, 255, 255),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w700,
      fontSize: 20,
    ),
    bodyLarge: TextStyle(
      color: Color.fromARGB(179, 255, 255, 255),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w700,
      fontSize: 25,
    ),
  ),

  // [BUTTON]
  outlinedButtonTheme: const OutlinedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStatePropertyAll(
        EdgeInsets.symmetric(vertical: 20, horizontal: 100),
      ),
      backgroundColor: MaterialStatePropertyAll(Color(0xff41b3cc)),
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

  // [SCAFFOLD/APP BAR]
  scaffoldBackgroundColor: const Color.fromARGB(108, 78, 78, 78),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w700,
      fontSize: 20,
    ),
  ),

  // [INPUT/CHECK BOX]
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(
      color: Colors.white,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w700,
      fontSize: 17,
    ),
    filled: true,
    fillColor: Colors.transparent,
  ),

  checkboxTheme: CheckboxThemeData(
    side: const BorderSide(
      color: Color.fromARGB(255, 53, 143, 163),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0), // Устанавливаем желаемый радиус
    ),
  ),

  // [DECORATION]
  dividerColor: Colors.white,
);
