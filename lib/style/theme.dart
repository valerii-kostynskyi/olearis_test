import 'package:flutter/material.dart';
import 'package:olearis_test/style/app_colors.dart';

final lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.white,
  fontFamily: 'Inter',
  focusColor: AppColors.blue,
  disabledColor: AppColors.lightGray,
  dividerColor: AppColors.darkGray,
  primaryColor: AppColors.black,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Inter',
      fontSize: 24,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      color: AppColors.black,
    ),
    displayMedium: TextStyle(
      fontFamily: 'Inter',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      color: AppColors.black,
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.blue,
    elevation: 3,
    titleTextStyle: TextStyle(
      fontFamily: 'Inter',
      fontSize: 24,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      color: AppColors.white,
    ),
  ),
  brightness: Brightness.light,
  iconTheme: const IconThemeData(
    size: 24,
    color: AppColors.white,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    focusColor: AppColors.white,
    hintStyle: TextStyle(
      fontSize: 14,
      color: AppColors.lightGray,
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.blue, width: 2.0),
    ),
  ),
);
