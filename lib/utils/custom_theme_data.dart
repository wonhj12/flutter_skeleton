import 'package:flutter/material.dart';
import 'package:flutter_skeleton/utils/palette.dart';

class CustomThemeData {
  static final ThemeData light = ThemeData(
    fontFamily: 'Pretendard',
    appBarTheme: AppBarTheme(
      titleTextStyle: Palette.heading.copyWith(color: Palette.primary),
      centerTitle: true,
      backgroundColor: Palette.background, // Appbar BG
    ),
    scaffoldBackgroundColor: Palette.background, // Scaffold BG
    colorScheme: const ColorScheme.light(
      primary: Palette.primary,
      primaryContainer: Palette.primaryContainer,
      secondary: Palette.secondary,
      error: Palette.error,
    ),
    highlightColor: Colors.transparent, // Modal highlight color
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: Palette.primary),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Palette.primary,
      unselectedItemColor: Palette.black,
      type: BottomNavigationBarType.fixed,
    ),
  );
}
