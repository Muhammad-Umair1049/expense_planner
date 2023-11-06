import 'package:flutter/material.dart';

const COLOR_PRIMARY = Colors.amber;
// const DARK_THEME_COLOR

ThemeData lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.amber,
    iconTheme: IconThemeData(color: Colors.black),
  ),
  brightness: Brightness.light,
  primarySwatch: COLOR_PRIMARY,
  iconTheme: IconThemeData(color: Colors.black87),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  iconTheme: IconThemeData(color: Colors.black54),
);
