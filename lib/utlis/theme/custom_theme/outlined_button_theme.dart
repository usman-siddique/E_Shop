import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EOutlinedButtonTheme {
  EOutlinedButtonTheme._();

  // Light Theme
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.black,
      side: const BorderSide(color: Color(0xFFFF7643)),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20.w),
      textStyle: TextStyle(
          fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.black),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
    ),
  );

  // Dark Theme
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      side: const BorderSide(color: Color(0xFFFF7643)),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20.w),
      textStyle: TextStyle(
          fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
    ),
  );
}
