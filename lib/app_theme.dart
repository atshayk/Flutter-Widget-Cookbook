import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Custom Color Constants Palette
  static const Color primaryBlue = Color(0xFF3B62FF);
  static const Color darkText = Color(0xFF1C1C1C);
  static const Color mutedGrey = Color(0xFF87879D);
  static const Color backgroundLight = Color(0xFFF8F9FA);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      primaryColor: primaryBlue,
      scaffoldBackgroundColor: backgroundLight,
      fontFamily: GoogleFonts.poppins().fontFamily, // Sets Poppins as the default font globally

      // Centralized Input Field Theme Setup
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        labelStyle: TextStyle(color: mutedGrey),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryBlue, width: 2),
        ),
      ),

      // Centralized Button Theme Setup
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
