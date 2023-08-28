// ignore_for_file: depend_on_referenced_packages, deprecated_member_use


import 'package:ask_anything_app/app/core/assets/app_icons.dart';
import 'package:ask_anything_app/app/core/utils/app_colors.dart';
import 'package:ask_anything_app/app/core/utils/app_textstyles.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import '../utils/size_utils.dart';


class SettingRowContainer extends StatelessWidget {
  final String prefixIconPath;
  final String title;

  final  VoidCallback? ontap;
  const  SettingRowContainer({
    Key? key,
    required this.title,
    required this.prefixIconPath,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: getHorizontalSize(343),
        height: getVerticalSize(50),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
                color: AppColors.shadowColor,
                offset: Offset(0, 6),
                blurRadius: 15,
                spreadRadius: 0)
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(16)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                prefixIconPath,
                height: getVerticalSize(14.5),
                color: AppColors.primaryColor,
              ),
              SizedBox(
                width: getHorizontalSize(12),
              ),
              Text(title,
                  style: AppTextStyles.miniMediumText.copyWith(
                      fontWeight: FontWeight.w500)),
              Expanded(
                child: SvgPicture.asset(
                  AppIcons.move,
                  alignment: Alignment.centerRight,
                  height: getVerticalSize(14),
                  color: AppColors.primaryLiteColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
