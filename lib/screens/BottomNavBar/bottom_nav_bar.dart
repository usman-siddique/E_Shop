import 'package:e_shop/screens/Cart/cart_screen.dart';
import 'package:e_shop/screens/Favourite/favourite_scren.dart';
import 'package:e_shop/screens/Home/home_screen.dart';
import 'package:e_shop/screens/Profile/profile_screen.dart';
import 'package:e_shop/utlis/constants/colors.dart';
import 'package:e_shop/utlis/constants/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({
    final Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  final PersistentTabController _controller = PersistentTabController();
  final bool _hideNavBar = false;

  List<Widget> _buildScreens() => [
        const HomeScreen(),
        const CartScreen(),
        const FavouriteScreen(),
        const ProfileScreen(),
      ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          inactiveIcon: const Icon(Icons.home_outlined),
          title: "Home",
          activeColorPrimary: EColors.white,
          inactiveColorPrimary: EColors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.shopping_cart),
          inactiveIcon: const Icon(Icons.shopping_cart_outlined),
          title: "Cart",
          activeColorPrimary: EColors.white,
          inactiveColorPrimary: EColors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.favorite),
          inactiveIcon: const Icon(Icons.favorite_outline),
          title: "Favourite",
          activeColorPrimary: EColors.white,
          inactiveColorPrimary: EColors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person),
          inactiveIcon: const Icon(Icons.person_2_outlined),
          title: "Profle",
          activeColorPrimary: EColors.white,
          inactiveColorPrimary: EColors.grey,
        ),
      ];

  @override
  Widget build(final BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return SafeArea(
      child: Scaffold(
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          resizeToAvoidBottomInset: true,
          navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
              ? 0.0
              : kBottomNavigationBarHeight,
          bottomScreenMargin: 0,
          backgroundColor: dark ? EColors.black : EColors.primary,
          hideNavigationBar: _hideNavBar,
          decoration: const NavBarDecoration(colorBehindNavBar: Colors.indigo),
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
          ),
          navBarStyle:
              NavBarStyle.style1, // Choose the nav bar style with this property
        ),
      ),
    );
  }
}
