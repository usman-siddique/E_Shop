import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EElevatedButtonTheme {
  EElevatedButtonTheme._();

  // Light Theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: const Color(0xFFFF7643),
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: Color(0xFFFF7643)),
      padding: EdgeInsets.symmetric(vertical: 16.h),
      textStyle: TextStyle(
          fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
    ),
  );

  // Dark Theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: const Color(0xFFFF7643),
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: Color(0xFFFF7643)),
      padding: EdgeInsets.symmetric(vertical: 16.h),
      textStyle: TextStyle(
          fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
    ),
  );
}
