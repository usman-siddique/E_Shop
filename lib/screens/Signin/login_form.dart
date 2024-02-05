import 'package:e_shop/Routes/app_navigation.dart';
import 'package:e_shop/Routes/app_navigation_routes.dart';
import 'package:e_shop/utlis/constants/helper_function.dart';
import 'package:e_shop/utlis/constants/sizes.dart';
import 'package:e_shop/utlis/constants/text_strings.dart';
import 'package:e_shop/widgets/outlined_button.dart';
import 'package:e_shop/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isShowPassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: ESizes.spaceBtwSections),
        child: Column(
          children: [
            // Email TextFormField
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                labelText: ETexts.email,
              ),
            ),
            SizedBox(height: ESizes.spaceBtwInputFields),

            // Password TextFormField
            TextFormField(
              controller: passwordController,
              obscureText: isShowPassword,
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.password_check),
                labelText: ETexts.password,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isShowPassword = !isShowPassword;
                    });
                  },
                  child: Icon(
                    isShowPassword ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
            ),

            SizedBox(height: ESizes.spaceBtwInputFields / 2),
            // Remember me & Forgot
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remember Me
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                    const Text(ETexts.rememberMe),
                  ],
                ),
                // Forget Password
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    ETexts.rememberMe,
                  ),
                ),
              ],
            ),
            SizedBox(height: ESizes.spaceBtwSections),
            // Buttons
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                text: (ETexts.signIn),
                press: () {
                  bool isVaildated = loginValidation(
                      emailController.text, passwordController.text);
                  if (isVaildated) {
                    AppNavigation.popAndPush(
                        routeName: AppNavRoutes.customBottomNavBar);
                  }
                },
              ),
            ),
            SizedBox(height: ESizes.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              child: OutlinePrimaryButton(
                text: (ETexts.createAccount),
                press: () {
                  AppNavigation.popAndPush(
                      routeName: AppNavRoutes.signUpScreen);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
