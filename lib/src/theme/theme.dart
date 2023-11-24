import 'package:flutter/material.dart';

const Color greenOlive = Color(0xFF728C6D);
const Color yellowRelax = Color(0xFFFFD166);
const Color yellowLight = Color(0xFFFFF9E6);
const Color blackCharcoal = Color(0xFF282828);
const Color blueNight = Color(0xFF36454F);

ThemeData lightTheme = ThemeData.light().copyWith(
  colorScheme: ColorScheme.fromSeed(
    seedColor: greenOlive,
    secondary: yellowRelax,
    secondaryContainer: yellowLight,
  ),
  useMaterial3: true,
);
