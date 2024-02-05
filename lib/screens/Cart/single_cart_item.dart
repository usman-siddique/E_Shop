import 'package:e_shop/model/product_model.dart';
import 'package:e_shop/provider/app_provider.dart';
import 'package:e_shop/utlis/constants/colors.dart';
import 'package:e_shop/utlis/constants/helper_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SingleCartItem extends StatefulWidget {
  final ProductModel singleProduct;
  const SingleCartItem({super.key, required this.singleProduct});

  @override
  State<SingleCartItem> createState() => _SingleCartItemState();
}

class _SingleCartItemState extends State<SingleCartItem> {
  int qty = 1;
  @override
  void initState() {
    qty = widget.singleProduct.qty ?? 1;
    setState(() {
      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
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
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  widget.singleProduct.image,
                ),
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
                            // Add & Remove QTY Buttons
                            Row(
                              children: [
                                CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  child: const CircleAvatar(
                                    maxRadius: 13,
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
                                // Qty Show
                                Text(
                                  qty.toString(),
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  child: const CircleAvatar(
                                    maxRadius: 13,
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
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              child: Text(
                                appProvider.getFavouriteProductList
                                        .contains(widget.singleProduct)
                                    ? "Remove to wishlist"
                                    : "Add to wishlist",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              onPressed: () {
                                if (!appProvider.getFavouriteProductList
                                    .contains(widget.singleProduct)) {
                                  appProvider.addFavouriteProduct(
                                      widget.singleProduct);
                                  showMessage("Added to wishlist");
                                } else {
                                  appProvider.removeFavouriteProduct(
                                      widget.singleProduct);
                                  showMessage("Removed from wishlist");
                                }
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
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        appProvider.removeCartProduct(widget.singleProduct);
                        showMessage("Removed from Cart");
                      },
                      child: CircleAvatar(
                        maxRadius: 13,
                        backgroundColor:
                            dark ? EColors.darkerGrey : EColors.primary,
                        child: const Icon(
                          Icons.delete,
                          color: EColors.white,
                        ),
                      ),
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
