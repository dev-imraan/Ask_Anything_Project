// ignore_for_file: deprecated_member_use

import 'package:ask_anything_app/app/core/assets/app_icons.dart';
import 'package:ask_anything_app/app/core/assets/app_images.dart';
import 'package:ask_anything_app/app/core/utils/app_colors.dart';
import 'package:ask_anything_app/app/core/utils/size_utils.dart';

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import '../utils/app_textstyles.dart';
import 'custom_bg.dart';

class CustomWidgetBg extends StatelessWidget {
  final VoidCallback? onBack;
  final Color iconColor;
  final String? herderText;
  final String? titleText;
  final String? subtitleText;

  final Widget bodyWidget;
  const CustomWidgetBg(
      {super.key,
      this.onBack,
      this.iconColor = const Color(0xff0d092a),
      this.herderText,
      this.titleText,
      this.subtitleText,
      this.bodyWidget = const SizedBox()});

  @override
  Widget build(BuildContext context) {
    return CustomImageContainer(
      imgpath: AppImages.bg,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: getPadding(
                  left: getHorizontalSize(1), top: getVerticalSize(50)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      flex: -1,
                      child: IconButton(
                        onPressed: onBack,
                        icon: SvgPicture.asset(
                          AppIcons.arrow,
                          color: iconColor,
                        ),
                        splashRadius: 1,
                      )),
                  Expanded(
                      child: Padding(
                    padding: getPadding(right: getHorizontalSize(30)),
                    child: Text(herderText!,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.miniLargeText),
                  )),
                ],
              ),
            ),
            Padding(
              padding: getPadding(
                left: getHorizontalSize(32),
                right: getHorizontalSize(32),
                top: getVerticalSize(40),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(titleText!,
                      style: AppTextStyles.miniLargeText
                          .copyWith(color: AppColors.primaryColor)),
                  SizedBox(
                    height: getVerticalSize(10),
                  ),
                  Text(subtitleText!,
                      style: AppTextStyles.smallText
                          .copyWith(color: AppColors.accentColor)),
                  SizedBox(
                    height: getVerticalSize(40),
                  ),
                  bodyWidget
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
