import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  //Headings
  static TextStyle titleLarge = GoogleFonts.robotoSlab(
    fontSize: 24.sp,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.4,
  );

  static TextStyle titleMedium = GoogleFonts.robotoSlab(
    fontSize: 20.sp,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.32,
  );
  static TextStyle titleSmall = GoogleFonts.robotoSlab(
    fontSize: 18.sp,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.28,
  );

  //Body
  static TextStyle bodyLarge = GoogleFonts.outfit(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.02,
  );
  static TextStyle bodyMedium = GoogleFonts.outfit(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.24,
  );

  ///inverse color
  static TextStyle labelMedium = GoogleFonts.outfit(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.24,
  );

  static TextStyle bodySmall = GoogleFonts.outfit(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.24,
  );
}
