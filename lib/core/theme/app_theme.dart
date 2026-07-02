import 'package:flutter/material.dart';
import 'package:tick_it/core/theme/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    brightness: .dark,
    scaffoldBackgroundColor: AppColors.cod_gray,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.outrageous_orange,
      surface: AppColors.log_cabin,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.log_cabin.withAlpha(100),
      border: OutlineInputBorder(borderRadius: .circular(12)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.outrageous_orange,
        foregroundColor: AppColors.almond,
        elevation: 0,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: AppColors.almond),
    ),
    cardTheme: CardThemeData(
      color: AppColors.log_cabin,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: .circular(12)),
    ),
  );
}
