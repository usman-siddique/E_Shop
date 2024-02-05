import 'package:e_shop/utlis/constants/colors.dart';
import 'package:e_shop/utlis/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    Key? key,
    required this.text,
    required this.img,
  }) : super(key: key);

  final String text, img;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          ETexts.onBoardingTitle,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: EColors.primary,
              ),
          textAlign: TextAlign.center,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        const Spacer(flex: 2),
        Image.asset(img, height: 235.h, width: 235.w),
      ],
    );
  }
}
