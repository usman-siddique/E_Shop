import 'package:e_shop/model/product_model.dart';
import 'package:e_shop/Routes/app_navigation_routes.dart';
import 'package:e_shop/screens/BottomNavBar/bottom_nav_bar.dart';
import 'package:e_shop/screens/BuyProduct/buy_product_screen.dart';
import 'package:e_shop/screens/Cart/cart_screen.dart';
import 'package:e_shop/screens/Favourite/favourite_scren.dart';
import 'package:e_shop/screens/Onboarding/onboarding_screen.dart';
import 'package:e_shop/screens/Privacy_TermsConditon/privacy_policy_screen.dart';
import 'package:e_shop/screens/Privacy_TermsConditon/tnc_screen.dart';
import 'package:e_shop/screens/Product_Details/product_detail_screen.dart';
import 'package:e_shop/screens/Profile/profile_screen.dart';
import 'package:e_shop/screens/Signin/signin_screen.dart';
import 'package:e_shop/screens/Home/home_screen.dart';
import 'package:e_shop/screens/Signup/signup_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    final args = settings.arguments;
    switch (settings.name) {
      case AppNavRoutes.initialRoute:
        return routeScreen(child: const OnBoardingScreen());

      case AppNavRoutes.signinScreen:
        return routeScreen(child: const SigninScreen());
      case AppNavRoutes.customBottomNavBar:
        return routeScreen(child: const CustomBottomNavBar());
      case AppNavRoutes.homeScreen:
        return routeScreen(child: const HomeScreen());
      case AppNavRoutes.signUpScreen:
        return routeScreen(child: const SignUpScreen());
      case AppNavRoutes.cartScreen:
        return routeScreen(child: const CartScreen());
      case AppNavRoutes.favouriteScreen:
        return routeScreen(child: const FavouriteScreen());
      case AppNavRoutes.checkOutScreen:
        return routeScreen(child: const CheckOutScreen());
      case AppNavRoutes.profileScreen:
        return routeScreen(child: const ProfileScreen());
      case AppNavRoutes.privacyPolicyScreen:
        return routeScreen(child: const PrivacyPolicyScreen());
      case AppNavRoutes.termsAndConditionsScreen:
        return routeScreen(child: const TermsAndConditionsScreen());
      case AppNavRoutes.productDetailsScreen:
        final product = settings.arguments as ProductModel;
        return MaterialPageRoute(
          builder: (context) => ProductDetailsScreen(singleProduct: product),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Text('Error Page');
    });
  }

  static Route<dynamic> routeScreen({
    Widget? child,
  }) {
    return MaterialPageRoute(
      // builder: (context) => child!,
      builder: (context) => SafeArea(
        child: child!,
      ),
    );
  }
}
