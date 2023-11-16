import 'package:flutter/material.dart';

const primaryColor = Color(0xff30aad1);

final appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
  primaryColor: primaryColor,
  textSelectionTheme: const TextSelectionThemeData(cursorColor: primaryColor),
  textTheme: const TextTheme(
      labelLarge: TextStyle(fontWeight: FontWeight.w400, color: primaryColor),
      bodyLarge: TextStyle(color: Colors.white, fontSize: 18),
      bodyMedium: TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(color: Colors.white)),
  iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(iconColor: MaterialStatePropertyAll(Colors.white))),
  buttonTheme: const ButtonThemeData(padding: EdgeInsets.zero),
  inputDecorationTheme: const InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: primaryColor),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primaryColor),
        borderRadius: BorderRadius.all(Radius.circular(12))),
  ),
  useMaterial3: true,
);
