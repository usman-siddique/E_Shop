import 'package:e_shop/utlis/constants/colors.dart';
import 'package:flutter/material.dart';

AnimatedContainer buildDots({required int index, required int currentPage}) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 200),
    margin: const EdgeInsets.only(right: 5),
    height: 6,
    width: currentPage == index ? 20 : 6,
    decoration: BoxDecoration(
      color: currentPage == index ? EColors.primary : const Color(0xFFD8D8D8),
      borderRadius: BorderRadius.circular(3),
    ),
  );
}
