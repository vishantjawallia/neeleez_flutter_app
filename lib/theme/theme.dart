import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/palettes.dart';

class CustomTheme {
  CustomTheme._();

  static ThemeData light = ThemeData(
    primaryColor: Palettes.red,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
      displayLarge: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 25, color: Palettes.white),
      displayMedium: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 23, color: Palettes.white),
      displaySmall: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 21, color: Palettes.white),
      headlineMedium: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 19, color: Palettes.white),
      headlineSmall: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 17, color: Palettes.white),
      titleLarge: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 15, color: Palettes.white),
      bodyLarge: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 14, color: Palettes.white),
      bodyMedium: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 13, color: Palettes.white),
      bodySmall: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12, color: Palettes.white),
    ),
  );
  static ThemeData dark = ThemeData(
    primaryColor: Palettes.red,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
      displayLarge: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 25, color: Palettes.white),
      displayMedium: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 23, color: Palettes.white),
      displaySmall: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 21, color: Palettes.white),
      headlineMedium: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 19, color: Palettes.white),
      headlineSmall: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 17, color: Palettes.white),
      titleLarge: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 15, color: Palettes.white),
      bodyLarge: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 14, color: Palettes.white),
      bodyMedium: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 13, color: Palettes.white),
      bodySmall: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12, color: Palettes.white),
    ),
  );
}
