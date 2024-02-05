import 'package:e_shop/Routes/app_navigation.dart';
import 'package:e_shop/Routes/app_navigation_routes.dart';
import 'package:e_shop/screens/Signup/terms_condton_chechbox.dart';
import 'package:e_shop/utlis/constants/helper_function.dart';
import 'package:e_shop/utlis/constants/sizes.dart';
import 'package:e_shop/utlis/constants/text_strings.dart';
import 'package:e_shop/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  SignUpFormState createState() => SignUpFormState();
}

class SignUpFormState extends State<SignUpForm> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isShowPassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: firstNameController,
                  decoration: const InputDecoration(
                    labelText: ETexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              SizedBox(width: ESizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: lastNameController,
                  decoration: const InputDecoration(
                    labelText: ETexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: ESizes.spaceBtwInputFields),
          // Username
          TextFormField(
            controller: usernameController,
            decoration: const InputDecoration(
              labelText: ETexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          SizedBox(height: ESizes.spaceBtwInputFields),
          // Email
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: ETexts.email,
              prefixIcon: Icon(Icons.email_outlined),
            ),
          ),
          SizedBox(height: ESizes.spaceBtwInputFields),
          // Phone#
          TextFormField(
            controller: phoneNoController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              labelText: ETexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          SizedBox(height: ESizes.spaceBtwInputFields),
          // Password
          TextFormField(
            controller: passwordController,
            obscureText: isShowPassword,
            decoration: InputDecoration(
              labelText: ETexts.password,
              prefixIcon: const Icon(Iconsax.password_check),
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
          SizedBox(height: ESizes.spaceBtwSections),

          // T & Conditions Checkbox
          const TermsCondtionsCheckBox(),
          SizedBox(height: ESizes.spaceBtwSections),

          // Sign UP Button
          SizedBox(
            width: double.infinity,
            child: PrimaryButton(
              text: ETexts.createAccount,
              press: () {
                bool isValidated = signupValidation(
                  firstNameController.text,
                  lastNameController.text,
                  usernameController.text,
                  emailController.text,
                  phoneNoController.text,
                  passwordController.text,
                );
                if (isValidated) {
                  AppNavigation.popAndPush(
                      routeName: AppNavRoutes.customBottomNavBar);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
