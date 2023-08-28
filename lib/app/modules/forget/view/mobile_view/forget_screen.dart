// ignore_for_file: depend_on_referenced_packages

import 'package:ask_anything_app/app/modules/forget/controller/forget_controller.dart';
import 'package:ask_anything_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/assets/app_icons.dart';
import '../../../../core/strings/app_strings.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_textstyles.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/custom_textfeild.dart';
import '../../../../core/widgets/custom_widget_bg.dart';

class ForgetScreen extends GetView<ForgetController> {
  const ForgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetController>(
      init: ForgetController(),
      builder: (controller) => CustomWidgetBg(
        herderText: kResetpassword,
        titleText: kForgetTitle,
        subtitleText: kForgetSubTitle,
        onBack: () {
          Get.offNamed(AppRoutes.login);
        },
        bodyWidget: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => CustomTextfeild(
                    bordercolor: !controller.isValidEmail.value
                        ? AppColors.transParentColor
                        : AppColors.errorColor,
                    focusedBorderColor: controller.isValidEmail.value
                        ? AppColors.transParentColor
                        : AppColors.primaryColor,
                    focusNode: controller.emailFocus,
                    controller: controller.emailController,
                    title: kEmailTitle,
                    hinttext: kEmailHintText,
                    prefiximg: AppIcons.email,
                    shadowColor: controller.emailFocused.value
                        ? AppColors.shadowColor
                        : AppColors.transParentColor,
                    hintcolor: controller.emailFocus.hasFocus
                        ? AppColors.blackColor
                        : AppColors.liteGrayColor,
                  )),
              controller.isValidEmail.value
                  ? Padding(
                      padding: getPadding(top: getVerticalSize(5)),
                      child: Text(
                        controller.validateEmail(controller.emailController),
                        style: AppTextStyles.smallText
                            .copyWith(color: AppColors.errorColor),
                      ),
                    )
                  : const SizedBox(),
              SizedBox(
                height: getVerticalSize(45),
              ),
              button(
                isLoading: controller.isLoading.value,
                text: kSubmit,
                ontap: () {
                  controller.isForget();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
