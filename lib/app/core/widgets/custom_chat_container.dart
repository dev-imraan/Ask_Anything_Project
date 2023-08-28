// ignore_for_file: non_constant_identifier_names, unused_import, depend_on_referenced_packages, must_be_immutable, deprecated_member_use

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ask_anything_app/app/core/utils/app_colors.dart';
import 'package:ask_anything_app/app/core/utils/app_textstyles.dart';
import 'package:ask_anything_app/app/core/utils/size_utils.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../assets/app_icons.dart';

// ignore: camel_case_types
class custom_chat_container extends StatelessWidget {
  final String title;
  final String discription;
  VoidCallback? OntapOnsave;
  VoidCallback? OntapOncopy;
  final String copyButtonText;
  final String saveButtonText;
  final String saveIconPath;
  final String copyIconPath;
  final bool isYes;

  custom_chat_container({
    Key? key,
    required this.title,
    this.OntapOncopy,
    this.OntapOnsave,
    this.discription = "",
    this.copyButtonText = "",
    this.saveButtonText = "",
    this.saveIconPath = AppIcons.save,
    this.copyIconPath = AppIcons.copy,
    this.isYes = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(
        left: getHorizontalSize(16),
        right: getHorizontalSize(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.chatContainerColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(getSize(12)),
              bottomLeft: Radius.circular(getSize(12)),
              bottomRight: Radius.circular(getSize(12))),
        ),
        child: Padding(
          padding: getPadding(
            top: getVerticalSize(11),
            left: getHorizontalSize(16),
            right: getHorizontalSize(16),
            bottom: getVerticalSize(12),
          ),
          child: InkWell(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: AppTextStyles.miniMediumText.copyWith(
                        fontSize: getFontSize(16),
                        color: AppColors.primaryColor)),
                SizedBox(
                  height: getVerticalSize(11),
                ),
                Container(
                  width: Get.width,
                  height: getVerticalSize(2),
                  decoration: BoxDecoration(
                    color: AppColors.liteGrayColor,
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(10),
                ),
                AnimatedTextKit(
                  

                    displayFullTextOnTap: false,
                    isRepeatingAnimation: false,
                    repeatForever: false,
                    totalRepeatCount: 0,
                    pause: const Duration(milliseconds: 5),
                    stopPauseOnTap: true,
                    animatedTexts: [
                      TypewriterAnimatedText(
                          speed: isYes
                              ? const Duration(milliseconds: 20)
                              : const Duration(milliseconds: 0),
                          textAlign: TextAlign.justify,
                          discription.trim(),
                          textStyle: AppTextStyles.miniMediumText.copyWith(
                              fontSize: getFontSize(16),
                              color: AppColors.blackColor),
                          curve: Curves.linear)
                    ]),

                // Text(discription,
                //     textAlign: TextAlign.justify,
                //     style: AppTextStyles.miniMediumText),
                SizedBox(
                  height: getVerticalSize(18),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                        onTap: OntapOnsave,
                        child: Container(
                          height: getVerticalSize(28),
                          decoration: BoxDecoration(
                              color: const Color(0xffddddef),
                              borderRadius:
                                  BorderRadius.circular(getSize(7))),
                          child: Padding(
                            padding: getPadding(all: getSize(7)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  saveIconPath,
                                  color: AppColors.accentColor,
                                ),
                                SizedBox(
                                  width: getVerticalSize(6),
                                ),
                                Text(saveButtonText,
                                    style: AppTextStyles.miniSmallText
                                        .copyWith(
                                            color: AppColors.accentColor))
                              ],
                            ),
                          ),
                        )),
                    SizedBox(
                      width: getHorizontalSize(8),
                    ),
                    InkWell(
                        onTap: OntapOncopy,
                        child: Container(
                          height: getVerticalSize(28),
                          decoration: BoxDecoration(
                              color: const Color(0xffddddef),
                              borderRadius: BorderRadius.circular(7.sp)),
                          child: Padding(
                            padding: getPadding(all: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  copyIconPath,
                                  color: AppColors.accentColor,
                                  fit: BoxFit.scaleDown,
                                ),
                                SizedBox(width: getHorizontalSize(6)),
                                Text(copyButtonText,
                                    style: AppTextStyles.miniSmallText
                                        .copyWith(
                                            color: AppColors.accentColor))
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
