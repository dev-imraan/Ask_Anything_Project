import 'package:ask_anything_app/app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages

class BuildDot {
  buildDot({required index, required context, required currentIndex}) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 3.h,
      width: currentIndex == index ? size.width / 15 : size.width / 187.6,
      margin: EdgeInsets.only(right: 4.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: currentIndex == index
              ? AppColors.primaryColor
              : AppColors.liteGrayColor),
    );
  }
}
