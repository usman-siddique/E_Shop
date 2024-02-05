import 'package:e_shop/Components/animated_dots.dart';
import 'package:e_shop/Routes/app_navigation.dart';
import 'package:e_shop/Routes/app_navigation_routes.dart';
import 'package:e_shop/screens/Onboarding/onboarding_content.dart';
import 'package:e_shop/utlis/constants/colors.dart';
import 'package:e_shop/utlis/constants/image_strings.dart';
import 'package:e_shop/utlis/constants/text_strings.dart';
import 'package:e_shop/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentPage = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> onBoardingData = [
      {
        "text": ETexts.onBoardingSubTitle1,
        "img": EImages.onBoardingImage1,
      },
      {
        "text": ETexts.onBoardingSubTitle2,
        "img": EImages.onBoardingImage2,
      },
      {
        "text": ETexts.onBoardingSubTitle3,
        "img": EImages.onBoardingImage3,
      }
    ];

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      AppNavigation.pushAndKillAll(
                          routeName: AppNavRoutes.signinScreen);
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: EColors.primary,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: onBoardingData.length,
                  itemBuilder: (context, index) => OnBoardingContent(
                    img: onBoardingData[index]["img"] ?? "",
                    text: onBoardingData[index]['text'] ?? "",
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          onBoardingData.length,
                          (index) =>
                              buildDots(index: index, currentPage: currentPage),
                        ),
                      ),
                      const Spacer(
                        flex: 3,
                      ),
                      PrimaryButton(
                        text: 'Continue',
                        press: () {
                          if (currentPage < onBoardingData.length - 1) {
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            AppNavigation.navigateTo(
                                routeName: AppNavRoutes.signinScreen);
                          }
                        },
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
