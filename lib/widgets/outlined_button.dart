import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OutlinePrimaryButton extends StatelessWidget {
  const OutlinePrimaryButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55.h,
      child: OutlinedButton(
        onPressed: press,
        child: Text(
          text,
        ),
      ),
    );
  }
}
