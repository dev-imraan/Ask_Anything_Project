import 'dart:async';
import 'dart:math';

import 'package:ask_anything_app/app/core/utils/hive_boxes.dart';
import 'package:ask_anything_app/app/core/utils/ui.dart';
import 'package:ask_anything_app/app/modules/login/model/hive_login_model.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class ForgetController extends GetxController with ForgetControllerInitializer {
  @override
  void onInit() {
    onEmpty();
    focus();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    emailFocus.dispose();
    super.dispose();
  }

  void onEmpty() {
    emailController.clear();
    emailFocus.unfocus();
    isValidEmail.value = false;
  }

  void focus() {
    emailFocus.addListener(() {
      emailFocused.value = emailFocus.hasFocus;
    });
  }

  validateEmail(TextEditingController value) {
    if (value.text.isEmpty) {
      return 'Please enter your email address';
    } else if (!value.text.contains("@")) {
      return 'Please enter a valid email address';
    } else {
      return "Incorrect Email";
    }
  }

  generatedOtp() {
    String otp = Random().nextInt(999999).toString().padLeft(6, "0");
    return otp;
  }

  isForget() {
    if (emailController.text.isNotEmpty && emailController.text.contains("@")) {
      isLoading.value = true;
      if (checkExistingEmail()) {
        isValidEmail.value = false;

        Timer(const Duration(seconds: 1), () {
          isLoading.value = false;
          Get.toNamed(AppRoutes.reset, arguments: [emailController]);
        });
      } else {
        Timer(const Duration(seconds: 1), () {
          isLoading.value = false;
          UI.errorSnackBar(message: "Your email address not exist");
        });
      }
    } else {
      isValidEmail.value = true;
    }
  }

  bool checkExistingEmail() {
    var isExistingEmail = false;
    var box = Boxes.auth();
    final data = box.values.toList().cast<HiveLoginModel>();
    for (var email in data) {
      if (email.email == emailController.text) {
        isExistingEmail = true;
      }
    }
    return isExistingEmail;
  }
}

mixin ForgetControllerInitializer {
  final isLoading = false.obs;
  final emailFocused = false.obs;

  final emailController = TextEditingController();
  final isValidEmail = false.obs;

  FocusNode emailFocus = FocusNode();
}
