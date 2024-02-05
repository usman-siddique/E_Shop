import 'package:e_shop/utlis/constants/colors.dart';
import 'package:e_shop/utlis/constants/image_strings.dart';
import 'package:e_shop/utlis/constants/sizes.dart';
import 'package:flutter/material.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: EColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(onPressed: () {}, icon: EImages.googleIcon),
        ),
        SizedBox(
          width: ESizes.spaceBtwItems,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: EColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(onPressed: () {}, icon: EImages.facebookIcon),
        ),
        SizedBox(
          width: ESizes.spaceBtwItems,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: EColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(onPressed: () {}, icon: EImages.twitterIcon),
        ),
      ],
    );
  }
}
