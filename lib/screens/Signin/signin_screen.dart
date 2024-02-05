import 'package:e_shop/Components/form_divider.dart';
import 'package:e_shop/Components/social_bittons.dart';
import 'package:e_shop/Components/spacing_style.dart';
import 'package:e_shop/screens/Signin/login_form.dart';
import 'package:e_shop/utlis/constants/sizes.dart';
import 'package:e_shop/utlis/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: ESpaceStyle.paddingWithAppbarHeight,
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Text(
                ETexts.loginTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: ESizes.sm),
              Text(
                ETexts.loginSubTitle,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: ESizes.spaceBtwSections),

              // Form
              const LoginForm(),

              // Divider
              const FormDivider(
                dividerText: ETexts.orSignInWith,
              ),

              SizedBox(height: ESizes.spaceBtwItems),

              // Footer
              const SocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
