import 'package:fake_store/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      // Color scheme
      primaryColor:
          AppStyles
              .primaryColor, // Green for primary elements (e.g., "Travel" button)
      scaffoldBackgroundColor:
          AppStyles.scaffoldBackgroundColor, // Light blue background
      colorScheme: const ColorScheme.light(
        primary: AppStyles.primaryColor,
        onPrimary: Colors.white, // Text/icon color on primary background
        secondary: AppStyles.almostBlack, // Black for "Create Event" button
        onSecondary: Colors.white, // Text color on "Create Event" button
        surface: Colors.white, // Background for cards or text fields
        onSurface: Color(0xFF333333), // Text color for labels
      ),

      // Text theme
      textTheme: GoogleFonts.urbanistTextTheme(),

      // Button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              AppStyles.primaryColor, // Black "Create Event" button
          foregroundColor: AppStyles.textColor, // Text/icon color on button
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          textStyle: GoogleFonts.urbanist(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // Card theme (for event type buttons)
      cardTheme: CardTheme(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Color(0xFFD3D3D3)),
        ),
      ),

      // Icon theme
      iconTheme: const IconThemeData(
        color: Color(0xFF333333), // Default icon color
      ),

      // AppBar theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppStyles.scaffoldBackgroundColor,
        elevation: 0,
        titleTextStyle: GoogleFonts.urbanist(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),

        iconTheme: IconThemeData(color: AppStyles.primaryColor),
      ),
    );
  }
}
