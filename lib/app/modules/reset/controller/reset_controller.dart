import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/utils/size_utils.dart';
import '../../../core/utils/ui.dart';
import '../../../routes/app_routes.dart';

class ResetController extends GetxController with ResetControllerInitilaizer {
  @override
  void onInit() {
    super.onInit();
    onEmpty();
    focus();
  }

  @override
  void dispose() {
    createPasswordController.dispose();
    confirmPasswordController.dispose();

    focuscreatepassword.dispose();
    focuscreatepassword.dispose();

    super.dispose();
  }

  void onEmpty() {
    createPasswordController.clear();
    confirmPasswordController.clear();

    focuscreatepassword.unfocus();
    focuscreatepassword.unfocus();
  }

  void focus() {
    focuscreatepassword.addListener(() {
      createPasswordFocused.value = focuscreatepassword.hasFocus;
    });
    focusconfirmpassword.addListener(() {
      confirmPasswordFocused.value = focusconfirmpassword.hasFocus;
    });
  }

  validatePassword(TextEditingController value) {
    if (value.text.isEmpty) {
      return "Enter your password";
    } else if (value.text.length < 6) {
      return "Your password lenght is less then 6";
    }
    return "Incorrect Password";
  }

  ontap(obscure) {
    obscure.value = !obscure.value;
  }

  icon({required obscure, required color}) {
    if (obscure == true) {
      return Icon(Icons.visibility, color: color, size: getSize(16));
    } else {
      return Icon(Icons.visibility_off, color: color, size: getSize(16));
    }
  }

  gonextpage() {
    if (createPasswordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty &&
        createPasswordController.text == confirmPasswordController.text) {
      // var box = Boxes.auth();
      // final data = box.values.toList().cast();

      UI.successSnackBar(message: "Password Changed", title: "Change Password");
      Timer(const Duration(seconds: 2), () {
        Get.offAllNamed(AppRoutes.login);
      });
      isValidcreatePassword.value = false;
      isValidconfirmPassword.value = false;
    } else {
      isValidcreatePassword.value = true;
      isValidconfirmPassword.value = true;
      UI.errorSnackBar(message: "Don't matched");
    }
  }
}

mixin ResetControllerInitilaizer {
  final isValidcreatePassword = false.obs;
  final isValidconfirmPassword = false.obs;
  final createPasswordFocused = false.obs;
  final formkey = GlobalKey<FormState>();
  final confirmPasswordFocused = false.obs;
  final createPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  FocusNode focuscreatepassword = FocusNode();
  FocusNode focusconfirmpassword = FocusNode();
  final obscure = true.obs;
  final obscure1 = true.obs;
}
