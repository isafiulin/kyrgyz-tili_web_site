import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  AppColors._();

  static const primary = Color(0xFFFA4F26);
  static const secondary = Color(0xFFF892AA);
  static const background = Color(0xFFFFF7F3);
  static const textTitle = Color(0xFF514F63);
  static const textBody = Color(0xFF6A687E);
}

class AppTheme {
  AppTheme._();

  static ThemeData light() {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: Colors.white,
      ),
      scaffoldBackgroundColor: AppColors.background,
    );

    final textTheme = GoogleFonts.robotoTextTheme(base.textTheme).copyWith(
      headlineLarge: GoogleFonts.roboto(
        fontSize: 44,
        fontWeight: FontWeight.w800,
        color: AppColors.textTitle,
        height: 1.12,
      ),
      headlineMedium: GoogleFonts.roboto(
        fontSize: 32,
        fontWeight: FontWeight.w800,
        color: AppColors.textTitle,
      ),
      titleLarge: GoogleFonts.roboto(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppColors.textTitle,
      ),
      titleMedium: GoogleFonts.roboto(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.textTitle,
      ),
      bodyLarge: GoogleFonts.roboto(
        fontSize: 16,
        color: AppColors.textBody,
        height: 1.45,
      ),
      bodyMedium: GoogleFonts.roboto(
        fontSize: 14,
        color: AppColors.textBody,
        height: 1.45,
      ),
    );

    return base.copyWith(
      textTheme: textTheme,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
