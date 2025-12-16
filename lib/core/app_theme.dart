import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/constants/app_colors.dart';

abstract class AppTheme {
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.black,
    fontFamily: "Inter",
    colorScheme: ColorScheme.fromSeed(
      primary: AppColors.primary,
      secondary: AppColors.white,
      onSecondary: AppColors.black,
      shadow: AppColors.gray,
      error: AppColors.red,
      seedColor: Colors.deepPurple,
      brightness: Brightness.dark,
    ),
    textTheme: TextTheme(
      displaySmall: TextStyle(
        fontSize: 36.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      ),
      headlineSmall: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      ),
      titleLarge: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      labelMedium: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
        fontFamily: "Roboto",
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.primary,
        fontFamily: "Roboto",
      ),
    ),
    appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.black,
      titleTextStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.primary,
      ),
      centerTitle: true,
      surfaceTintColor: AppColors.primary,
      foregroundColor: AppColors.primary,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.primary,
      selectionHandleColor: AppColors.primary,
      selectionColor: AppColors.primary.withValues(alpha: 0.2),
    ),
  );
}
