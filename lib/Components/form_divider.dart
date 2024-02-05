import 'package:e_shop/utlis/constants/colors.dart';
import 'package:e_shop/utlis/constants/helper_function.dart';
import 'package:flutter/material.dart';

class FormDivider extends StatelessWidget {
  const FormDivider({
    super.key,
    required this.dividerText,
  });

  final String dividerText;
  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: dark ? EColors.darkGrey : EColors.grey,
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
          ), // Add flex property
        ),
        Text(
          dividerText,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
            color: dark ? EColors.darkGrey : EColors.grey,
            thickness: 0.5,
            indent: 5,
            endIndent: 60,
          ), // Add flex property
        ),
      ],
    );
  }
}
