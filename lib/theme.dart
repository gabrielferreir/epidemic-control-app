import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final primaryColor = Colors.blue;
final accentColor = Colors.indigoAccent;

final theme = ThemeData(
    primaryColor: primaryColor,
    accentColor: accentColor,
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    appBarTheme: AppBarTheme(color: primaryColor),
    inputDecorationTheme: fieldTheme,
    cursorColor: accentColor);

final fieldTheme = InputDecorationTheme(
    fillColor: primaryColor,
    labelStyle: TextStyle(color: primaryColor),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(color: primaryColor)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(color: primaryColor)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(color: Colors.red, width: 1)),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(color: Colors.red, width: 1)));
