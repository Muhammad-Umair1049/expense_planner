import 'package:flutter/material.dart';

const COLOR_PRIMARY = Colors.amber;

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
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
    iconTheme: IconThemeData(color: Colors.black12),
  ),
  brightness: Brightness.dark,
  primarySwatch: COLOR_PRIMARY,
  iconTheme: IconThemeData(color: Colors.black54),
);
