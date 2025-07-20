import 'package:contact/components/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData CustomeDarkTheme = ThemeData(
    primaryColor: const Color.fromRGBO(255, 241, 212, 1),
    scaffoldBackgroundColor: AppColors.background,
    fontFamily: 'Roboto',
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: AppColors.text,
      ),
      bodyMedium: TextStyle(fontSize: 16, color: AppColors.text),
    ),
    iconTheme: const IconThemeData(color: AppColors.text),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.buttonText,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.buttonText,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
  );
}
