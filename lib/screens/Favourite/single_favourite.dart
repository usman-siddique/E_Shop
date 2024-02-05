import 'package:e_shop/model/product_model.dart';
import 'package:e_shop/provider/app_provider.dart';
import 'package:e_shop/utlis/constants/colors.dart';
import 'package:e_shop/utlis/constants/helper_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SingleFavouriteItem extends StatefulWidget {
  final ProductModel singleProduct;
  const SingleFavouriteItem({super.key, required this.singleProduct});

  @override
  State<SingleFavouriteItem> createState() => _SingleFavouriteItemState();
}

class _SingleFavouriteItemState extends State<SingleFavouriteItem> {
  int qty = 1;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color: dark ? EColors.darkerGrey : EColors.primary, width: 3),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 150.h,
              color:
                  dark ? EColors.darkerGrey : EColors.primary.withOpacity(0.5),
              child: Image.asset(
                widget.singleProduct.image,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 150.h,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 12),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              widget.singleProduct.name,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              child: Text(
                                "Removed to wishlist",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              onPressed: () {
                                AppProvider appProvider =
                                    Provider.of<AppProvider>(context,
                                        listen: false);
                                appProvider.removeFavouriteProduct(
                                    widget.singleProduct);
                                showMessage("Removed from wishlist");
                              },
                            ),
                          ],
                        ),
                        Text(
                          "${widget.singleProduct.price.toString()} Rs",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
