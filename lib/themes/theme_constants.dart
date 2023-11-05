import 'package:flutter/material.dart';

const COLOR_PRIMARY = Colors.amber;

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: COLOR_PRIMARY,
  iconTheme: IconThemeData(color: Colors.black),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: COLOR_PRIMARY,
  iconTheme: IconThemeData(color: Colors.amber),
);
