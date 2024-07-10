import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeUtils {
  static ThemeData getLightTheme(String font) {
    return ThemeData(
      brightness: Brightness.light,
      textTheme: _getTextTheme(font),
      // Tambahkan properti tema lainnya sesuai kebutuhan
    );
  }

  static ThemeData getDarkTheme(String font) {
    return ThemeData(
      brightness: Brightness.dark,
      textTheme: _getTextTheme(font),
      // Tambahkan properti tema lainnya sesuai kebutuhan
    );
  }

  static TextTheme _getTextTheme(String font) {
    switch (font) {
      case 'Roboto':
        return GoogleFonts.robotoTextTheme();
      case 'Open Sans':
        return GoogleFonts.openSansTextTheme();
      case 'Lato':
        return GoogleFonts.latoTextTheme();
      case 'Comic Neue':
        return GoogleFonts.comicNeueTextTheme();
      case 'Montserrat':
        return GoogleFonts.montserratTextTheme();
      case 'Nunito':
        return GoogleFonts.nunitoTextTheme();
      case 'Raleway':
        return GoogleFonts.ralewayTextTheme();
      default:
        return GoogleFonts.poppinsTextTheme();
    }
  }
}
