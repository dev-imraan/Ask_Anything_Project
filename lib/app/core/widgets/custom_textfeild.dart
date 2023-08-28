// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:ask_anything_app/app/core/utils/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/size_utils.dart';

class CustomTextfeild extends StatelessWidget {
  final VoidCallback? ontap;
  final Color bordercolor;
  final bool obscureText;
  final GlobalKey? formkey;
  final String errorText;
  final Color errorcolor;
  final Color errorbordercolor;
  final dynamic icon;
  final Color shadowColor;
  final bool filled;
  final Color onChangeColor;
  final Color iconcolor;
  final Color hintcolor;
  final Color fillcolor;
  final bool autofocus;
  final TextEditingController? controller;

  final int maxlines;
  final int errormaxlines;
  FocusNode? focusNode;
  final String title;
  BoxConstraints? boxConstraints;
  final TextInputType? keyBoardType;
  final String hinttext;
  final String prefiximg;
  final Color focusedBorderColor;

  CustomTextfeild({
    Key? key,
    this.boxConstraints,
    this.formkey,
    this.errormaxlines = 1,
    this.keyBoardType,
    this.maxlines = 1,
    this.title = "",
    this.fillcolor = Colors.white,
    this.bordercolor = AppColors.transParentColor,
    this.errorcolor = AppColors.transParentColor,
    this.errorbordercolor = AppColors.transParentColor,
    this.onChangeColor = Colors.white,
    this.iconcolor = Colors.white,
    this.autofocus = false,
    this.filled = false,
    this.obscureText = false,
    required this.hinttext,
    this.prefiximg = "",
    this.focusNode,
    this.ontap,
    this.icon,
    this.hintcolor = Colors.white,
    this.shadowColor = AppColors.transParentColor,
    this.controller,
    this.errorText = "",  this.focusedBorderColor = AppColors.transParentColor, 
  }) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.miniSmallText),
        SizedBox(
          height: getVerticalSize(2),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: bordercolor,
            ),
            boxShadow: [
              BoxShadow(
                  color: shadowColor,
                  offset: const Offset(0, 4),
                  blurRadius: 10,
                  spreadRadius: 0)
            ],
          ),
          child: TextFormField(
            onTap: ontap,
            style: AppTextStyles.miniMediumText
                .copyWith(color: AppColors.blackColor),
            keyboardType: keyBoardType,
            controller: controller,
            cursorColor: AppColors.blackColor,
            obscureText: obscureText,
            focusNode: focusNode,
            autofocus: autofocus,
            decoration: InputDecoration(
                enabled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.sp),
                    borderSide: const BorderSide(
                      color: AppColors.fillColor,
                    )),
                filled: true,
                fillColor: AppColors.fillColor,
                contentPadding:
                    EdgeInsets.symmetric(vertical: getVerticalSize(12)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11.sp),
                    borderSide: BorderSide(color: focusedBorderColor)),
                prefixIcon: SvgPicture.asset(
                  prefiximg,
                  color: AppColors.primaryColor,
                  fit: BoxFit.scaleDown,
                ),
                suffixIcon: icon,
                hintText: hinttext,
                prefixIconConstraints: boxConstraints,
                hintStyle:
                    AppTextStyles.miniMediumText.copyWith(color: hintcolor)),
          ),
        ),
      ],
    );
  }
}
