import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle heroMessage = GoogleFonts.poppins(
    color: Colors.white,
    fontSize: 30,
    fontWeight: FontWeight.w500,
    height: 1.2,
  );

  static TextStyle pageTitle = GoogleFonts.poppins(
    color: Colors.black,
    fontSize: 28,
    fontWeight: FontWeight.w600,
  );

  static TextStyle subtitle = GoogleFonts.poppins(
    color: Colors.black54,
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );

  static TextStyle fieldLabel = GoogleFonts.poppins(
    color: Colors.black87,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle buttonLabel = GoogleFonts.poppins(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static TextStyle errorText = GoogleFonts.poppins(
    color: AppColors.errorRed,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
}
