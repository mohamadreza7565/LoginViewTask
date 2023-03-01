

import 'dart:ui';

import 'package:flutter/material.dart';

class MaterialColors{

  static const int primary = 0xFFD73300;

  static const MaterialAccentColor primaryAccentColor = MaterialAccentColor(
    primary,
    <int, Color>{
      500: Color(primary)
    },
  );

  static const MaterialColor primaryColor = MaterialColor(
    primary,
    <int, Color>{
      50: Color(0xFFD73300),
      100: Color(0xFFD73300),
      200: Color(0xFFD73300),
      300: Color(0xFFD73300),
      400: Color(0xFFD73300),
      500: Color(primary),
      600: Color(0xFFD73300),
      700: Color(0xFFD73300),
      800: Color(0xFFD73300),
      900: Color(0xFFD73300),
    },
  );

}