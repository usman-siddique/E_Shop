import 'package:e_shop/Components/form_divider.dart';
import 'package:e_shop/Routes/app_navigation.dart';
import 'package:e_shop/Routes/app_navigation_routes.dart';
import 'package:e_shop/screens/Signup/signup_form.dart';
import 'package:e_shop/utlis/constants/colors.dart';
import 'package:e_shop/utlis/constants/sizes.dart';
import 'package:e_shop/utlis/constants/text_strings.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(ETexts.signupTitle1,
                  style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: ESizes.spaceBtwSections),

              //Form
              const SignUpForm(),

              SizedBox(height: ESizes.spaceBtwSections),

              // Divider
              const FormDivider(dividerText: ETexts.alreadyHaveAccount),

              // Login
              Center(
                child: TextButton(
                    onPressed: () {
                      AppNavigation.popAndPush(
                          routeName: AppNavRoutes.signinScreen);
                    },
                    child: Text(
                      'Sign In',
                      style: (Theme.of(context).textTheme.headlineSmall)
                          ?.copyWith(color: EColors.primary),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
