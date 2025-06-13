import 'package:flutter/material.dart';

class AppTheme {
  // Private constructor to prevent instantiation
  AppTheme._();

// Colors
static const Color primaryColor = Color(0xFF95DFFF); // Light cyan-blue
static const Color secondaryColor = Color(0xFF40C4FF); // Deeper sky blue
static const Color accentColor = Color(0xFF26A69A); // Teal for highlights
static const Color backgroundColor = Color(0xFFF7F9FC); // Off-white
static const Color surfaceColor = Color(0xFFEFF3F6); // Soft gray-blue
static const Color errorColor = Color(0xFFEF5350); // Red for errors
static const Color textPrimaryColor = Color(0xFF212121); // Dark gray
static const Color textSecondaryColor = Color(0xFF757575); // Medium gray

  // Text Styles
  static const TextStyle heading1 = TextStyle(
    fontFamily: 'ComicNeue',
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: textPrimaryColor,
  );

  static const TextStyle heading2 = TextStyle(
    fontFamily: 'ComicNeue',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: textPrimaryColor,
  );

  static const TextStyle heading3 = TextStyle(
    fontFamily: 'ComicNeue',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: textPrimaryColor,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: 'ComicNeue',
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: textPrimaryColor,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: 'ComicNeue',
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: textPrimaryColor,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: 'ComicNeue',
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: textSecondaryColor,
  );

  // Button Styles
  static final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );

  static final ButtonStyle secondaryButtonStyle = OutlinedButton.styleFrom(
    foregroundColor: primaryColor,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    side: const BorderSide(color: primaryColor),
  );

  // Input Decoration
  static InputDecoration inputDecoration({
    required String label,
    String? hint,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: textSecondaryColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: textSecondaryColor.withOpacity(0.5)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: primaryColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: errorColor),
      ),
      labelStyle: bodyMedium.copyWith(color: textSecondaryColor),
      hintStyle: bodyMedium.copyWith(color: textSecondaryColor.withOpacity(0.5)),
    );
  }

  // Card Theme
  static final CardThemeData cardTheme = CardThemeData(
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    color: backgroundColor,
  );

  // App Theme Data
  static ThemeData get theme => ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: primaryColor,
          secondary: secondaryColor,
          error: errorColor,
          background: backgroundColor,
          surface: surfaceColor,
        ),
        textTheme: const TextTheme(
          displayLarge: heading1,
          displayMedium: heading2,
          displaySmall: heading3,
          bodyLarge: bodyLarge,
          bodyMedium: bodyMedium,
          bodySmall: bodySmall,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: primaryButtonStyle,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: secondaryButtonStyle,
        ),
        cardTheme: cardTheme,
        useMaterial3: true,
      );
} 