// ignore_for_file: must_be_immutable

import 'package:ask_anything_app/app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_textstyles.dart';
import '../utils/size_utils.dart';

class CustomChatTextfield extends StatelessWidget {
  final String hinttext;
  VoidCallback onpress;
  VoidCallback? onTap;
  final FocusNode? focusNode;

  final TextEditingController? controller;
  final void Function(String)? onChanged;

  final Widget icon;
  CustomChatTextfield({
    Key? key,
    this.onTap,
    required this.hinttext,
    required this.onpress,
    this.controller,
    this.icon = const SizedBox(),
    this.focusNode,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
          padding: getPadding(
            top: getVerticalSize(5),
            left: getHorizontalSize(8),
            right: getHorizontalSize(8),
            bottom: getVerticalSize(5),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: TextFormField(
                    onTap: onTap,
                    // onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    maxLines: 3,
                    minLines: 1,
                    keyboardType: TextInputType.multiline,
                    style: AppTextStyles.miniMediumText.copyWith(
                        fontSize: getFontSize(16), color: AppColors.blackColor),
                    onChanged: onChanged,
                    focusNode: focusNode,
                    controller: controller,
                    cursorColor: AppColors.blackColor,
                    cursorWidth: 1.5,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.fillColor,
                      hintText: hinttext,
                      hintStyle: AppTextStyles.miniMediumText
                          .copyWith(color: AppColors.liteGrayColor),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(23.sp),
                          borderSide:
                              BorderSide(color: AppColors.liteGrayColor)),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: getVerticalSize(13),
                          horizontal: getHorizontalSize(13)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(23.sp),
                          borderSide: BorderSide(
                            color: AppColors.liteGrayColor,
                          )),
                    )),
              ),
              SizedBox(
                width: getHorizontalSize(5),
              ),
              Expanded(
                  flex: -1,
                  child: GestureDetector(
                    onTap: onpress,
                    child: Container(
                      height: getVerticalSize(48),
                      width: getHorizontalSize(48),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryLiteColor,
                      ),
                      child: Center(child: icon),
                    ),
                  ))
            ],
          )),
    );
  }
}
