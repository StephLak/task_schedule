import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_schedule/helpers/res/app_colors.dart';

class Styles {
  static TextStyle heading({
    Color color = AppColors.primaryColor,
    FontWeight fontWeight = FontWeight.w700,
    double size = 24,
  }) {
    return GoogleFonts.urbanist(
      fontSize: size,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle body({
    Color color = AppColors.primaryColor,
    FontWeight fontWeight = FontWeight.w600,
    double size = 14,
  }) {
    return GoogleFonts.urbanist(
      fontSize: size,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle lightBody({
    Color color = AppColors.secondaryColor,
    FontWeight fontWeight = FontWeight.w500,
    double size = 14,
  }) {
    return GoogleFonts.urbanist(
      fontSize: size,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
