// ignore_for_file: depend_on_referenced_packages

import 'package:ask_anything_app/app/core/utils/app_textstyles.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/size_utils.dart';

// ignore: camel_case_types, must_be_immutable
class Custom_Column extends StatelessWidget {
  final String text;

  VoidCallback? ontap;
  final Color textcolor;
  final Color dividercolor;
  Custom_Column(
      {super.key,
      this.ontap,
      required this.text,
      this.dividercolor = AppColors.transParentColor,
      this.textcolor = AppColors.transParentColor,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          Text(text,
              style:AppTextStyles.mediumText.copyWith(color: textcolor)),
          SizedBox(
            height: getVerticalSize(11),
          ),
          Container(
            alignment: Alignment.topCenter,
            height: getVerticalSize(2),
            width: getHorizontalSize(116),
            color: dividercolor,
          ),
        ],
      ),
    );
  }
}
