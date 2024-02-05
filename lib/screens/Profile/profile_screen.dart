import 'package:e_shop/Routes/app_navigation.dart';
import 'package:e_shop/Routes/app_navigation_routes.dart';
import 'package:e_shop/utlis/constants/helper_function.dart';
import 'package:e_shop/utlis/constants/sizes.dart';
import 'package:e_shop/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                children: [
                  const Icon(Icons.person_outline, size: 150),
                  Text(
                    "M Usman",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    "usman@gmail.com",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: 130.w,
                    child: PrimaryButton(
                      text: "Edit Profile",
                      press: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      showMessage("Your Order Screen not found");
                    },
                    child: const ListTile(
                      leading: Icon(Icons.shopping_bag_outlined),
                      title: Text("Your Orders"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      AppNavigation.navigateTo(
                        routeName: AppNavRoutes.favouriteScreen,
                      );
                    },
                    child: const ListTile(
                      leading: Icon(Icons.favorite_outline),
                      title: Text("Favourite"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showMessage("About Us");
                    },
                    child: const ListTile(
                      leading: Icon(Icons.info_outline),
                      title: Text("About Us"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      AppNavigation.navigateTo(
                        routeName: AppNavRoutes.privacyPolicyScreen,
                      );
                    },
                    child: const ListTile(
                      leading: Icon(Icons.privacy_tip_outlined),
                      title: Text("Privacy Policy"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      AppNavigation.navigateTo(
                        routeName: AppNavRoutes.signinScreen,
                      );
                    },
                    child: const ListTile(
                      leading: Icon(Icons.exit_to_app),
                      title: Text("Log Out"),
                    ),
                  ),
                  SizedBox(height: ESizes.md),
                  const Text("Version 1.0.0"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
