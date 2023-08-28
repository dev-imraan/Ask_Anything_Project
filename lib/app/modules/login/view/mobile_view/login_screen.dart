// ignore: use_key_in_widget_constructors

import 'package:ask_anything_app/app/core/assets/app_icons.dart';
import 'package:ask_anything_app/app/core/utils/app_colors.dart';
import 'package:ask_anything_app/app/core/widgets/custom_textfeild.dart';
import 'package:ask_anything_app/app/core/widgets/custom_widget_bg.dart';
import 'package:ask_anything_app/app/modules/login/controller/login_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../../core/strings/app_strings.dart';
import '../../../../core/utils/size_utils.dart';

import '../../../../core/widgets/custom_column.dart';

import '../../../../core/widgets/login_widget.dart';
import '../../../../core/widgets/signup_widget.dart';
import '../../../../routes/app_routes.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) => Obx(
              () => CustomWidgetBg(
                iconColor: AppColors.transParentColor,
                herderText:
                    controller.currentIndex.value == 0 ? kLogIn : kSignUp,
                titleText: controller.currentIndex.value == 0
                    ? kLoginTitle
                    : kSignUpTitle,
                subtitleText: controller.currentIndex.value == 0
                    ? kLoginSubTitle
                    : kSignUpSubTitle,
                bodyWidget: Column(
                  children: [
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Custom_Column(
                            ontap: () {
                              controller.changeIndex(0);
                              controller.onEmpty();
                            },
                            text: kLOGIN,
                            textcolor: controller.currentIndex.value == 0
                                ? AppColors.primaryColor
                                : AppColors.liteGrayColor,
                            dividercolor: controller.currentIndex.value == 0
                                ? AppColors.primaryColor
                                : AppColors.transParentColor,
                          ),
                          Custom_Column(
                            text: kSIGNUP,
                            ontap: () {
                              controller.changeIndex(1);
                              controller.onEmpty();
                            },
                            textcolor: controller.currentIndex.value == 1
                                ? AppColors.primaryColor
                                : AppColors.liteGrayColor,
                            dividercolor: controller.currentIndex.value == 1
                                ? AppColors.primaryColor
                                : AppColors.transParentColor,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getVerticalSize(30),
                    ),
                    Obx(
                      () => controller.currentIndex.value == 0
                          ? LoginWidget(
                              loginEmailTexfield: CustomTextfeild(
                                focusedBorderColor:
                                    controller.isValidLoginEmail.value
                                        ? AppColors.transParentColor
                                        : AppColors.primaryColor,
                                focusNode: controller.loginEmailFocus,
                                controller: controller.loginemailcontroller,
                                title: kEmailTitle,
                                hinttext: kEmailHintText,
                                prefiximg: AppIcons.email,
                                bordercolor: !controller.isValidLoginEmail.value
                                    ? AppColors.transParentColor
                                    : AppColors.errorColor,
                                shadowColor: controller.loginEmailfocused.value
                                    ? AppColors.shadowColor
                                    : AppColors.transParentColor,
                                hintcolor: controller.loginEmailFocus.hasFocus
                                    ? AppColors.blackColor
                                    : AppColors.liteGrayColor,
                              ),
                              emailErrorText:
                                  controller.errorMessageForLoginEmail,
                              passwordErrorText:
                                  controller.errormessageForLoginPassword,
                              isValidateEmail:
                                  controller.isValidLoginEmail.value,
                              isValidatePassword:
                                  controller.isValidLoginPassword.value,
                              loginpasswordTexfield: CustomTextfeild(
                                focusedBorderColor:
                                    controller.isValidLoginPassword.value
                                        ? AppColors.transParentColor
                                        : AppColors.primaryColor,
                                bordercolor:
                                    !controller.isValidLoginPassword.value
                                        ? AppColors.transParentColor
                                        : AppColors.errorColor,
                                focusNode: controller.loginPasswordfocus,
                                shadowColor:
                                    controller.loginPaswordfocused.value
                                        ? AppColors.shadowColor
                                        : AppColors.transParentColor,
                                controller: controller.loginpasswordcontroller,
                                obscureText: controller.obscure.value,
                                icon: IconButton(
                                  onPressed: () {
                                    controller.ontap();
                                  },
                                  splashColor: AppColors.whiteColor,
                                  splashRadius: 2,
                                  icon: controller.icon(
                                      color:
                                          controller.loginPasswordfocus.hasFocus
                                              ? AppColors.blackColor
                                              : AppColors.accentColor,
                                      obscure: controller.obscure.value),
                                ),
                                title: kPasswordTitle,
                                hinttext: kPasswordHintText,
                                prefiximg: AppIcons.lock,
                                hintcolor:
                                    controller.loginPasswordfocus.hasFocus
                                        ? AppColors.blackColor
                                        : AppColors.liteGrayColor,
                              ),
                              onlogin: () {
                                controller.onLogin();
                              },
                              onForgetPassword: () {
                                controller.onEmpty();
                                Get.toNamed(AppRoutes.forget);
                              },
                              isLoading: controller.isLoginLoading.value,
                            )
                          : SignUpWidget(
                              signUpNameTextfield: CustomTextfeild(
                                focusedBorderColor: AppColors.primaryColor,
                                shadowColor: controller.signUpNamefocused.value
                                    ? AppColors.shadowColor
                                    : AppColors.transParentColor,
                                controller: controller.signupnamecontroller,
                                title: kNameTitle,
                                hinttext: kNameHintText,
                                prefiximg: AppIcons.person,
                                focusNode: controller.signUpNamefocus,
                                hintcolor: controller.signUpNamefocus.hasFocus
                                    ? AppColors.blackColor
                                    : AppColors.liteGrayColor,
                              ),
                              signUpEmailTexfield: CustomTextfeild(
                                bordercolor:
                                    !controller.isValidSignUpEmail.value
                                        ? AppColors.transParentColor
                                        : AppColors.errorColor,
                                focusedBorderColor:
                                    controller.isValidSignUpEmail.value
                                        ? AppColors.transParentColor
                                        : AppColors.primaryColor,
                                shadowColor: controller.signUpEmailfocused.value
                                    ? AppColors.shadowColor
                                    : AppColors.transParentColor,
                                controller: controller.signupemailcontroller,
                                focusNode: controller.signUpEmailFocus,
                                title: kEmailTitle,
                                hinttext: kEmailHintText,
                                prefiximg: AppIcons.email,
                                hintcolor: controller.signUpEmailFocus.hasFocus
                                    ? AppColors.blackColor
                                    : AppColors.liteGrayColor,
                              ),
                              emailErrorText:
                                  controller.errorMessageForSignUpEmail,
                              passwordErrorText:
                                  controller.errormessageForSignUpPassword,
                              isValidateEmail:
                                  controller.isValidSignUpEmail.value,
                              isValidatePassword:
                                  controller.isValidSignUpPassword.value,
                              signUppasswordTexfield: CustomTextfeild(
                                bordercolor:
                                    !controller.isValidSignUpPassword.value
                                        ? AppColors.transParentColor
                                        : AppColors.errorColor,
                                focusedBorderColor:
                                    controller.isValidSignUpPassword.value
                                        ? AppColors.transParentColor
                                        : AppColors.primaryColor,
                                shadowColor:
                                    controller.signUpPaswordfocused.value
                                        ? AppColors.shadowColor
                                        : AppColors.transParentColor,
                                controller: controller.signuppasswordcontroller,
                                focusNode: controller.signUpPasswordfocus,
                                obscureText: controller.obscure.value,
                                icon: IconButton(
                                  onPressed: () {
                                    controller.ontap();
                                  },
                                  splashColor: AppColors.whiteColor,
                                  splashRadius: 2,
                                  icon: controller.icon(
                                      color: controller
                                              .signUpPasswordfocus.hasFocus
                                          ? AppColors.blackColor
                                          : AppColors.accentColor,
                                      obscure: controller.obscure.value),
                                ),
                                title: kCreate8DigitPasswordTitle,
                                hinttext: kCreatePasswordHintText,
                                prefiximg: AppIcons.lock,
                                hintcolor:
                                    controller.signUpPasswordfocus.hasFocus
                                        ? AppColors.blackColor
                                        : AppColors.liteGrayColor,
                              ),
                              isLoading: controller.isSignUpLoading.value,
                              onSignup: () {
                                controller.isSignUp();
                              },
                            ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
