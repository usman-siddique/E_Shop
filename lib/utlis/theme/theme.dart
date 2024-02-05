import 'package:e_shop/utlis/theme/custom_theme/appbar_theme.dart';
import 'package:e_shop/utlis/theme/custom_theme/chechbox_theme.dart';
import 'package:e_shop/utlis/theme/custom_theme/elevated_button_theme.dart';
import 'package:e_shop/utlis/theme/custom_theme/outlined_button_theme.dart';
import 'package:e_shop/utlis/theme/custom_theme/text_field_theme.dart';
import 'package:e_shop/utlis/theme/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';

class EAppTheme {
  EAppTheme._();

  // Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: const Color(0xFFFF7643),
    textTheme: ETextTheme.lightTextTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: EAppBarTheme.lightAppBarTheme,
    checkboxTheme: ECheckboxTheme.lightCheckboxTheme,
    elevatedButtonTheme: EElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: EOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: ETextFormFieldTheme.lightInputDecorationTheme,
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: const Color(0xFFFF7643),
    textTheme: ETextTheme.darkTextTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: EAppBarTheme.darkAppBarTheme,
    checkboxTheme: ECheckboxTheme.darkCheckboxTheme,
    elevatedButtonTheme: EElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: EOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: ETextFormFieldTheme.darkInputDecorationTheme,
  );
}
