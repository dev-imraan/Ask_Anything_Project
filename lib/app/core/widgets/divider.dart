// ignore_for_file: camel_case_types, depend_on_referenced_packages

import 'package:ask_anything_app/app/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';

import '../utils/app_textstyles.dart';
import '../utils/size_utils.dart';

class Custom_Divider extends StatelessWidget {
  const Custom_Divider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: getHorizontalSize(134),
          height: getVerticalSize(1),
          decoration: BoxDecoration(color: AppColors.liteGrayColor),
        ),
        Text("OR",
            style: AppTextStyles.miniMediumText.copyWith(
                color: AppColors.accentColor, fontWeight: FontWeight.w500)),
        Container(
          width: getHorizontalSize(132),
          height: getVerticalSize(1),
          decoration: BoxDecoration(
            color: AppColors.liteGrayColor,
          ),
        ),
      ],
    );
  }
}
