import 'package:e_shop/model/product_model.dart';
import 'package:e_shop/Routes/app_navigation.dart';
import 'package:e_shop/Routes/app_navigation_routes.dart';
import 'package:e_shop/utlis/constants/colors.dart';
import 'package:e_shop/utlis/constants/helper_function.dart';
import 'package:e_shop/utlis/constants/image_strings.dart';
import 'package:e_shop/utlis/constants/sizes.dart';
import 'package:e_shop/utlis/constants/text_strings.dart';
import 'package:e_shop/widgets/outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Heading
              Text(
                'E Commerce',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: EColors.primary),
              ),
              SizedBox(height: ESizes.spaceBtwItems),

              // Search Box
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Search...',
                ),
              ),
              SizedBox(height: ESizes.spaceBtwItems),

              // Categories Cards
              Text(
                "Categories",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: ESizes.sm),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categoriesList
                      .map(
                        (e) => Card(
                          color: dark ? EColors.darkestGrey : EColors.white,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: SizedBox(
                            height: 100.h,
                            width: 100.w,
                            child: Image.asset(e),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(height: ESizes.spaceBtwItems),

              // Best Products Gridview
              Text(
                "Best Products",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: ESizes.sm),
              GridView.builder(
                padding: const EdgeInsets.only(bottom: 50),
                shrinkWrap: true,
                primary: false,
                itemCount: bestProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.9,
                    crossAxisCount: 2),
                itemBuilder: (ctx, index) {
                  ProductModel singleProduct = bestProducts[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: dark
                          ? EColors.darkerGrey
                          : EColors.primary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8.w),
                    ),
                    child: Column(
                      children: [
                        // Image
                        Padding(
                          padding: EdgeInsets.only(top: ESizes.sm),
                          child: Image.asset(
                            singleProduct.image,
                            width: 80.w,
                            height: 80.h,
                          ),
                        ),
                        // Product Name & Price
                        Text(
                          singleProduct.name,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          "Price: ${singleProduct.price} Rs",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(
                          height: ESizes.defaultSpace,
                        ),
                        // BUY Button
                        SizedBox(
                          height: 50.h,
                          width: 140.w,
                          child: OutlinePrimaryButton(
                            text: 'Buy',
                            press: () {
                              AppNavigation.navigateTo(
                                routeName: AppNavRoutes.productDetailsScreen,
                                arguments: singleProduct,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<String> categoriesList = [
  EImages.sportIcon,
  EImages.clothIcon,
  EImages.shoeIcon,
  EImages.cosmeticsIcon,
  EImages.animalIcon,
  EImages.toyIcon,
  EImages.furnitureIcon,
  EImages.jeweleryIcon,
];

List<ProductModel> bestProducts = [
  ProductModel(
    image: "assets/images/Popular_Product1.png",
    id: "1",
    name: "PS4 Console White",
    price: "100",
    description: ETexts.descriptionProduct,
    isFavourite: false,
    status: 'Pending',
  ),
  ProductModel(
    image: "assets/images/Popular_Product2.png",
    id: "2",
    name: "IPhone XS",
    price: "150",
    description: ETexts.descriptionProduct,
    isFavourite: false,
    status: 'Pending',
  ),
  ProductModel(
    image: "assets/images/Popular_Product3.png",
    id: "1",
    name: "Nike Shoes",
    price: "90",
    description: ETexts.descriptionProduct,
    isFavourite: false,
    status: 'Pending',
  ),
  ProductModel(
    image: "assets/images/Popular_Product4.png",
    id: "1",
    name: "ASER Laptop 1",
    price: "200",
    description: ETexts.descriptionProduct,
    isFavourite: false,
    status: 'Pending',
  ),
  ProductModel(
    image: "assets/images/Popular_Product4.png",
    id: "1",
    name: "ASER Laptop 2",
    price: "220",
    description: ETexts.descriptionProduct,
    isFavourite: false,
    status: 'Pending',
  ),
  ProductModel(
    image: "assets/images/Popular_Product4.png",
    id: "1",
    name: "ASER Laptop 3",
    price: "250",
    description: ETexts.descriptionProduct,
    isFavourite: false,
    status: 'Pending',
  ),
];
