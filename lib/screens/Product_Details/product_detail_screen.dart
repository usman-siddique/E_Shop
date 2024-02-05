import 'package:e_shop/Routes/app_navigation.dart';
import 'package:e_shop/Routes/app_navigation_routes.dart';
import 'package:e_shop/model/product_model.dart';
import 'package:e_shop/provider/app_provider.dart';
import 'package:e_shop/utlis/constants/colors.dart';
import 'package:e_shop/utlis/constants/helper_function.dart';
import 'package:e_shop/utlis/constants/sizes.dart';
import 'package:e_shop/widgets/outlined_button.dart';
import 'package:e_shop/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel singleProduct;

  const ProductDetailsScreen({
    super.key,
    required this.singleProduct,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int qty = 1;

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              AppNavigation.popAndPush(routeName: AppNavRoutes.cartScreen);
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(ESizes.md),

        // Products Details
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(widget.singleProduct.image,
                height: 400.h, width: 400.w),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Name
                Text(
                  widget.singleProduct.name,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                // Favourite IconButton
                IconButton(
                  onPressed: () {
                    setState(() {
                      widget.singleProduct.isFavourite =
                          !widget.singleProduct.isFavourite;
                    });
                    if (widget.singleProduct.isFavourite) {
                      appProvider.addFavouriteProduct(widget.singleProduct);
                    } else {
                      appProvider.removeFavouriteProduct(widget.singleProduct);
                    }
                  },
                  icon: Icon(
                    appProvider.getFavouriteProductList
                            .contains(widget.singleProduct)
                        ? Icons.favorite
                        : Icons.favorite_border,
                  ),
                ),
              ],
            ),
            Text(widget.singleProduct.description),
            SizedBox(height: ESizes.sm),

            // Add & Remove QTY Buttons
            Row(
              children: [
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: const CircleAvatar(
                    backgroundColor: EColors.primary,
                    child: Icon(
                      Icons.remove,
                      color: EColors.white,
                    ),
                  ),
                  onPressed: () {
                    if (qty >= 1) {
                      setState(() {
                        qty--;
                      });
                    }
                  },
                ),
                SizedBox(width: 8.w),
                // Qty Show
                Text(
                  qty.toString(),
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                SizedBox(width: 8.w),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: const CircleAvatar(
                    backgroundColor: EColors.primary,
                    child: Icon(
                      Icons.add,
                      color: EColors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      qty++;
                    });
                  },
                ),
              ],
            ),
            const Spacer(),

            // ADD to CART & BUY Buttons
            OutlinePrimaryButton(
              text: "ADD TO CART",
              press: () {
                AppProvider appProvider =
                    Provider.of<AppProvider>(context, listen: false);
                ProductModel productModel =
                    widget.singleProduct.copyWith(qty: qty);
                appProvider.addCartProduct(productModel);
                showMessage("Added to Cart");
              },
            ),
            SizedBox(height: ESizes.spaceBtwInputFields),
            PrimaryButton(
              text: "BUY",
              press: () {},
            ),

            SizedBox(
              height: ESizes.defaultSpace,
            )
          ],
        ),
      ),
    );
  }
}
