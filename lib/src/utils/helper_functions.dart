import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class HelperFunctions {
  static String? emptyValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

  static void showAppSnackBar(
    BuildContext context,
    String message, {
    Color backgroundColor = Colors.black,
    Color messageColor = Colors.white,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: GoogleFonts.urbanist(
            color: messageColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        backgroundColor: backgroundColor,
      ),
    );
  }
}
