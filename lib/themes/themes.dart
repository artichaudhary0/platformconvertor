import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.white54,
  textTheme:  lightTextTheme,
);

TextStyle lightTextStyle = const TextStyle(fontSize: 20, color: Colors.black);
TextTheme lightTextTheme = TextTheme(bodyLarge: lightTextStyle);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.black,
  textTheme:  darkTextTheme,
);

TextStyle darkTextStyle = const TextStyle(fontSize: 20, color: Colors.white54);
TextTheme darkTextTheme = TextTheme(bodyLarge: darkTextStyle);




