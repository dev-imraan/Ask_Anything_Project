import 'package:ask_anything_app/app/core/widgets/custom_widget_bg.dart';
import 'package:ask_anything_app/app/modules/reset/controller/reset_controller.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/assets/app_icons.dart';
import '../../../../core/strings/app_strings.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_textstyles.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/custom_textfeild.dart';

class ResetScreen extends GetView<ResetController> {
  @override
  const ResetScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResetController>(
        init: ResetController(),
        builder: (controller) => CustomWidgetBg(
              herderText: kResetpassword,
              titleText: kResetTitle,
              subtitleText: kResetSubTitle,
              onBack: () {
                Get.back();
              },
              bodyWidget: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => CustomTextfeild(
                        focusedBorderColor:
                            controller.isValidcreatePassword.value
                                ? AppColors.transParentColor
                                : AppColors.primaryColor,
                        bordercolor: !controller.isValidcreatePassword.value
                            ? AppColors.transParentColor
                            : AppColors.errorColor,
                        focusNode: controller.focuscreatepassword,
                        shadowColor: controller.createPasswordFocused.value
                            ? AppColors.shadowColor
                            : AppColors.transParentColor,
                        controller: controller.createPasswordController,
                        obscureText: controller.obscure.value,
                        icon: GestureDetector(
                          onTap: () {
                            controller.ontap(controller.obscure);
                          },
                          child: controller.icon(
                              color: controller.focuscreatepassword.hasFocus
                                  ? AppColors.blackColor
                                  : AppColors.accentColor,
                              obscure: controller.obscure.value),
                        ),
                        title: kCreate8DigitPasswordTitle,
                        hinttext: kCreatePasswordHintText,
                        prefiximg: AppIcons.lock,
                        hintcolor: controller.focuscreatepassword.hasFocus
                            ? AppColors.blackColor
                            : AppColors.liteGrayColor,
                      ),
                    ),
                    controller.isValidcreatePassword.value
                        ? Padding(
                            padding: getPadding(top: getVerticalSize(5)),
                            child: Text(
                              controller.validatePassword(
                                  controller.createPasswordController),
                              style: AppTextStyles.smallText
                                  .copyWith(color: AppColors.errorColor),
                            ),
                          )
                        : const SizedBox(),
                    SizedBox(
                      height: getVerticalSize(18),
                    ),
                    Obx(
                      () => CustomTextfeild(
                        focusedBorderColor:
                            controller.isValidconfirmPassword.value
                                ? AppColors.transParentColor
                                : AppColors.primaryColor,
                        bordercolor: !controller.isValidconfirmPassword.value
                            ? AppColors.transParentColor
                            : AppColors.errorColor,
                        focusNode: controller.focusconfirmpassword,
                        shadowColor: controller.confirmPasswordFocused.value
                            ? AppColors.shadowColor
                            : AppColors.transParentColor,
                        controller: controller.confirmPasswordController,
                        obscureText: controller.obscure1.value,
                        icon: GestureDetector(
                          onTap: () {
                            controller.ontap(controller.obscure1);
                          },
                          child: controller.icon(
                              color: controller.focusconfirmpassword.hasFocus
                                  ? AppColors.blackColor
                                  : AppColors.accentColor,
                              obscure: controller.obscure1.value),
                        ),
                        title: kConfirmPasswordTitle,
                        hinttext: kConfirmPasswordHintText,
                        prefiximg: AppIcons.lock,
                        hintcolor: controller.focusconfirmpassword.hasFocus
                            ? AppColors.blackColor
                            : AppColors.liteGrayColor,
                      ),
                    ),
                    controller.isValidconfirmPassword.value
                        ? Padding(
                            padding: getPadding(top: getVerticalSize(5)),
                            child: Text(
                              controller.validatePassword(
                                  controller.confirmPasswordController),
                              style: AppTextStyles.smallText
                                  .copyWith(color: AppColors.errorColor),
                            ),
                          )
                        : const SizedBox(),
                    SizedBox(
                      height: getVerticalSize(45),
                    ),
                    button(
                      text: kSubmit,
                      ontap: () {
                        controller.gonextpage();
                      },
                    ),
                  ],
                ),
              ),
            ));
  }
}
