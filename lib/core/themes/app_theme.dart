import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jp_app_flutter/core/constants/color_constants.dart';
import 'package:jp_app_flutter/core/constants/style_constants.dart';

class AppTheme {
  static ThemeData getAppTheme() {
    return ThemeData(
      colorScheme: const ColorScheme.light(
          background: kWhite
      ),
      primaryColor: kPrimary,
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.lilitaOne(
              color: kBlack,
              fontWeight: FontWeight.w600,
              fontSize: kDimens20
          ),
          bodyMedium: GoogleFonts.lilitaOne(
              color: kBlack,
              fontWeight: FontWeight.w400,
              fontSize: kDimens15
          ),
          bodySmall: GoogleFonts.lilitaOne(
              color: kBlack,
              fontWeight: FontWeight.w400,
              fontSize: kDimens12
          ),
        )
    );
  }
}