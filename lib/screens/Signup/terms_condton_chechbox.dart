import 'package:e_shop/Routes/app_navigation.dart';
import 'package:e_shop/Routes/app_navigation_routes.dart';
import 'package:e_shop/utlis/constants/colors.dart';
import 'package:e_shop/utlis/constants/helper_function.dart';
import 'package:e_shop/utlis/constants/sizes.dart';
import 'package:e_shop/utlis/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsCondtionsCheckBox extends StatelessWidget {
  const TermsCondtionsCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24.w,
          height: 24.h,
          child: Checkbox(value: true, onChanged: (value) {}),
        ),
        SizedBox(width: ESizes.spaceBtwItems),
        GestureDetector(
          onTap: () {
            AppNavigation.navigateTo(
              routeName: AppNavRoutes.privacyPolicyScreen,
            );
          },
          child: Text.rich(
            TextSpan(children: [
              TextSpan(
                  text: ETexts.iAgreeTo,
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: ETexts.privacyPolicy,
                  style: Theme.of(context).textTheme.bodyMedium?.apply(
                        color: dark ? EColors.white : EColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? EColors.white : EColors.primary,
                      )),
              TextSpan(
                  text: ' and ', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: ETexts.termsofUse,
                  style: Theme.of(context).textTheme.bodyMedium?.apply(
                        color: dark ? EColors.white : EColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? EColors.white : EColors.primary,
                      )),
            ]),
          ),
        )
      ],
    );
  }
}
