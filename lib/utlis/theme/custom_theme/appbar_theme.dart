import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EAppBarTheme {
  EAppBarTheme._();

  static final lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black, size: 24.h),
    actionsIconTheme: IconThemeData(color: Colors.black, size: 24.h),
    titleTextStyle: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );

  static final darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black, size: 24.h),
    actionsIconTheme: IconThemeData(color: Colors.white, size: 24.h),
    titleTextStyle: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );
}
