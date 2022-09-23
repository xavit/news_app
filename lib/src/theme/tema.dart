import 'package:flutter/material.dart';

final miTema = ThemeData.dark().copyWith(
  primaryColor: Colors.red,
  scaffoldBackgroundColor: Colors.black,
  textTheme: const TextTheme(
    bodyText2: TextStyle(color: Colors.white),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.redAccent),
);
