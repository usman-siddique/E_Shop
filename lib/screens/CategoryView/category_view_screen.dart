import 'package:e_shop/model/category_model.dart';
import 'package:e_shop/utlis/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryViewScreen extends StatefulWidget {
  final CategoryModel singleProduct;
  const CategoryViewScreen({super.key, required this.singleProduct});

  @override
  State<CategoryViewScreen> createState() => _CategoryViewScreenState();
}

class _CategoryViewScreenState extends State<CategoryViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(ESizes.md),

      // Products Details
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(widget.singleProduct.image, height: 400.h, width: 400.w),
        ],
      ),
    );
  }
}
