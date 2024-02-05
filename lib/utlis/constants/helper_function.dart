import 'package:e_shop/utlis/constants/colors.dart';
import 'package:e_shop/utlis/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HelperFunction {
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}

void showMessage(String message) {
  Fluttertoast.showToast(
    msg: message,
    timeInSecForIosWeb: 3,
    backgroundColor: EColors.primary,
    textColor: Colors.white,
    fontSize: 16,
  );
}

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Builder(
      builder: (context) {
        return SizedBox(
          width: 100.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(
                color: EColors.primary,
              ),
              SizedBox(
                height: ESizes.spaceBtwItems,
              ),
              Container(
                margin: EdgeInsets.only(left: 7.w),
                child: const Text('Loading ...'),
              )
            ],
          ),
        );
      },
    ),
  );

  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext contex) {
      return alert;
    },
  );
}

bool loginValidation(String email, String password) {
  // Regular expression for a valid email address
  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

  // Regular expression for a password with at least 6 characters, alphabets, and digits
  final passwordRegex = RegExp(r'^(?=.*[a-zA-Z])(?=.*\d).{6,}$');

  if (email.isEmpty && password.isEmpty) {
    showMessage("Both fields are empty");
    return false;
  } else if (email.isEmpty) {
    showMessage("Email is empty");
    return false;
  } else if (!emailRegex.hasMatch(email)) {
    showMessage("Enter a valid email address");
    return false;
  } else if (password.isEmpty) {
    showMessage("Password is empty");
    return false;
  } else if (!passwordRegex.hasMatch(password)) {
    showMessage(
        "Password must have at least 6 characters with alphabets and digits");
    return false;
  } else {
    return true;
  }
}

bool signupValidation(String firstName, String lastName, String username,
    String email, String phoneNo, String password) {
  // Regular expression for a valid email address
  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

  // Regular expression for a phone number with exactly 11 digits
  final phoneRegex = RegExp(r'^\d{11}$');

  // Regular expression for a password with at least 6 characters, alphabets, and digits
  final passwordRegex = RegExp(r'^(?=.*[a-zA-Z])(?=.*\d).{6,}$');

  if (firstName.isEmpty ||
      lastName.isEmpty ||
      username.isEmpty ||
      email.isEmpty ||
      phoneNo.isEmpty ||
      password.isEmpty) {
    showMessage("All fields are required");
    return false;
  } else if (!emailRegex.hasMatch(email)) {
    showMessage("Enter a valid email address");
    return false;
  } else if (!phoneRegex.hasMatch(phoneNo)) {
    showMessage("Enter a valid 11-digit phone number");
    return false;
  } else if (!passwordRegex.hasMatch(password)) {
    showMessage(
        "Password must have at least 6 characters with alphabets and digits");
    return false;
  } else {
    return true;
  }
}
