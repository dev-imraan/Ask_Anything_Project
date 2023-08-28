// ignore: use_key_in_widget_constructors
import 'package:ask_anything_app/app/modules/otp/controller/otp_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/strings/app_strings.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_textstyles.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/custom_widget_bg.dart';
import '../../../../routes/app_routes.dart';

class OtpScreen extends GetView<OtpController> {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpController>(
      init: OtpController(),
      builder: (controller) => CustomWidgetBg(
          onBack: () {
            Get.toNamed(AppRoutes.forget);
          },
          herderText: kResetpassword,
          titleText: kOtpTitle,
          subtitleText: kOtpSubTitle,
          bodyWidget: Column(
            children: [
              PinCodeTextField(
                validator: (value) => controller.validateOtp(value),
                onChanged: (value) {},
                appContext: context,
                pastedTextStyle: const TextStyle(
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                ),
                length: 6,
                obscureText: true,
                obscuringWidget: Container(
                    width: getHorizontalSize(12),
                    height: getVerticalSize(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.blackColor,
                    )),
                blinkWhenObscuring: true,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  selectedColor: AppColors.fillColor,
                  activeColor: AppColors.fillColor,
                  inactiveColor: AppColors.fillColor,
                  shape: PinCodeFieldShape.box,
                  inactiveFillColor: AppColors.fillColor,
                  selectedFillColor: AppColors.fillColor,
                  borderRadius: BorderRadius.circular(getSize(12)),
                  activeFillColor: AppColors.fillColor,
                  fieldWidth: getHorizontalSize(45),
                ),
                cursorColor: AppColors.blackColor,
                animationDuration: const Duration(milliseconds: 200),
                enableActiveFill: true,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: getVerticalSize(45),
              ),
              button(
                text: kSubmit,
                ontap: () {
                  Get.toNamed(AppRoutes.reset);
                },
              ),
              SizedBox(
                height: getVerticalSize(26),
              ),
              InkWell(
                onTap: () {},
                child: Align(
                  alignment: Alignment.center,
                  child: Text(kResendCode,
                      style: AppTextStyles.smallText
                          .copyWith(color: AppColors.accentColor)),
                ),
              ),
            ],
          )),
    );
  }
}
