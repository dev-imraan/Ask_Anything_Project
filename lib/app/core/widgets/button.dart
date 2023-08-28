// ignore_for_file: camel_case_types, depend_on_referenced_packages

import 'package:ask_anything_app/app/core/utils/app_colors.dart';
import 'package:ask_anything_app/app/core/utils/app_textstyles.dart';
import 'package:ask_anything_app/app/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class button extends StatelessWidget {
  final VoidCallback? ontap;
  final bool  isLoading;
  final String text;
  final Widget icon;
  final Color borderColor;
  final Color textColor;
  final Color containerColor;
  const button(
      {Key? key,
      required this.text,
      required this.ontap,
      this.icon = const SizedBox(),
      this.borderColor = AppColors.transParentColor,
      this.textColor = AppColors.whiteColor,
      this.containerColor = const Color(0xff6a5ae0),  this.isLoading =false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: size.height / 16.4,
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(15.sp),
          border: Border.all(color: borderColor, width: getHorizontalSize(1)),
          boxShadow: const [
            BoxShadow(
                color: AppColors.shadowColor,
                offset: Offset(0, 6),
                blurRadius: 15,
                spreadRadius: 0)
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(
              width: getHorizontalSize(5),
            ),
             !isLoading?Text(text,
                style: AppTextStyles.miniMediumText
                    .copyWith(color: textColor, fontWeight: FontWeight.w500)):CircularProgressIndicator(
               strokeWidth: getHorizontalSize(2),
               color: AppColors.whiteColor,
             )
          ],
        ),
      ),
    );
  }
}