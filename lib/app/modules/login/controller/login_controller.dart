// ignore_for_file: unrelated_type_equality_checks, prefer_typing_uninitialized_variables

import 'dart:async';

import 'package:ask_anything_app/app/core/utils/hive_boxes.dart';
import 'package:ask_anything_app/app/modules/login/model/hive_login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../core/utils/ui.dart';
import '../../../routes/app_routes.dart';

class LoginController extends GetxController with LoginControllerInitializer {
  @override
  void onInit() async {
    super.onInit();

    onEmpty();
    focus();
  }

  @override
  void dispose() {
    loginemailcontroller.dispose();
    loginpasswordcontroller.dispose();
    signupemailcontroller.dispose();
    signupnamecontroller.dispose();
    signuppasswordcontroller.dispose();
    loginEmailFocus.dispose();
    loginPasswordfocus.dispose();
    signUpNamefocus.dispose();
    signUpEmailFocus.dispose();
    signUpPasswordfocus.dispose();
    super.dispose();
  }

  void onEmpty() {
    loginemailcontroller.clear();
    loginpasswordcontroller.clear();
    signupemailcontroller.clear();
    signupnamecontroller.clear();
    signuppasswordcontroller.clear();
    loginEmailFocus.unfocus();
    loginPasswordfocus.unfocus();
    signUpNamefocus.unfocus();
    signUpEmailFocus.unfocus();
    signUpPasswordfocus.unfocus();
    isValidLoginEmail.value = false;
    isValidLoginPassword.value = false;
    isValidSignUpEmail.value = false;
    isValidSignUpPassword.value = false;
  }

  void focus() {
    loginEmailFocus.addListener(() {
      loginEmailfocused.value = loginEmailFocus.hasFocus;
    });
    loginPasswordfocus.addListener(() {
      loginPaswordfocused.value = loginPasswordfocus.hasFocus;
    });
    signUpEmailFocus.addListener(() {
      signUpEmailfocused.value = signUpEmailFocus.hasFocus;
    });
    signUpNamefocus.addListener(() {
      signUpNamefocused.value = signUpNamefocus.hasFocus;
    });
    signUpPasswordfocus.addListener(() {
      signUpPaswordfocused.value = signUpPasswordfocus.hasFocus;
    });
  }

  ontap() {
    obscure.value = !obscure.value;
  }

  icon({required obscure, required color}) {
    if (obscure == true) {
      return Icon(Icons.visibility, color: color, size: 16.sp);
    } else {
      return Icon(Icons.visibility_off, color: color, size: 16.sp);
    }
  }

  Future<void> onLogin() async {
    isLoginLoading.value = true;
    if (loginValidate()) {
      isLoginLoading.value = false;
      isValidLoginEmail.value = true;
      isValidLoginPassword.value = true;
    } else {
      isValidLoginEmail.value = false;
      isValidLoginPassword.value = false;
      final loginBox = Boxes.auth();

      final List<HiveLoginModel> data =
          loginBox.values.toList().cast<HiveLoginModel>();
      if (data.isEmpty) {
        Timer(const Duration(seconds: 1), () {
          isLoginLoading.value = false;
          UI.errorSnackBar(
            title: "Login Failed",
            message: "Your account does not exist",
          );
        });
      } else {
        for (final user in data) {
          if (user.email == loginemailcontroller.text &&
              user.password == loginpasswordcontroller.text) {
            isLogin = true;
          }

          if (isLogin) {
            loginEmailFocus.unfocus();
            loginPasswordfocus.unfocus();
            var getDetails = await Hive.openBox("info");
            getDetails.put("email", user.email);
            getDetails.put("name", user.name);

            Timer(const Duration(seconds: 1), () {
              isLoginLoading.value = false;
              UI.successSnackBar(message: "Successfully login", title: "Login");
              Get.offNamed(AppRoutes.dashboard);
            });
          } else {
            Timer(const Duration(seconds: 1), () {
              isLoginLoading.value = false;
              UI.errorSnackBar(
                title: "Login Failed",
                message: "Your email and password does not correct",
              );
            });
          }
        }
      }
    }
  }

  loginValidate() {
    bool value = false;
    if (loginemailcontroller.text.isEmpty &&
        loginpasswordcontroller.text.isEmpty) {
      errorMessageForLoginEmail = "Email is Empty";
      errormessageForLoginPassword = "Password is Empty";
      value = true;
    } else if (!loginemailcontroller.text.contains("@")) {
      errorMessageForLoginEmail = "Enter correct Email";
      value = true;
    } else if (loginpasswordcontroller.text.length < 6) {
      errormessageForLoginPassword = "Password lenght  Must be up to 6";
      value = true;
    }
    return value;
  }

  signUpValidate() {
    String value = "";

    if (signupemailcontroller.text.isEmpty &&
        signuppasswordcontroller.text.isEmpty) {
      errorMessageForSignUpEmail = "Email is Empty";
      errormessageForSignUpPassword = "Password is Empty";
      value = errormessageForSignUpPassword;

      value = errorMessageForSignUpEmail;
    } else if (signuppasswordcontroller.text.isEmpty) {
      errormessageForSignUpPassword = "Password is Empty";
      value = errormessageForSignUpPassword;
    } else if (!signupemailcontroller.text.contains("@")) {
      errorMessageForSignUpEmail = "Enter correct Email";
      value = errorMessageForSignUpEmail;
    } else if (signuppasswordcontroller.text.length < 6) {
      errorMessageForSignUpEmail = "";
      value = errorMessageForSignUpEmail;
      errormessageForSignUpPassword = "Password lenght  Must be up to 6";
      value = errormessageForSignUpPassword;
    } else {
      errormessageForSignUpPassword = "";
      value = errormessageForSignUpPassword;
    }

    return value;
  }

  isSignUp() async {
    isSignUpLoading.value = true;
    final signUpBox = Boxes.auth();
    final data = signUpBox.values.toList();
    final checkCondition = signUpValidate();
    try {
      if (checkCondition.isNotEmpty) {
        isSignUpLoading.value = false;
        errorMessageForSignUpEmail == ""
            ? isValidSignUpEmail.value = false
            : isValidSignUpEmail.value = true;
        errormessageForSignUpPassword == ""
            ? isValidSignUpPassword.value = false
            : isValidSignUpPassword.value = true;
      } else {
        if (data.isEmpty) {
          isValidSignUpEmail.value = false;
          isValidSignUpPassword.value = false;
          signUpEmailFocus.unfocus();
          signUpNamefocus.unfocus();
          signUpPasswordfocus.unfocus();

          final signUpBox = Boxes.auth();
          final saveData = HiveLoginModel(
              email: signupemailcontroller.text,
              name: signupnamecontroller.text,
              password: signuppasswordcontroller.text);
          signUpBox.add(saveData);
          saveData.save();

          Timer(const Duration(seconds: 1), () {
            isSignUpLoading.value = false;

            currentIndex.value = 0;
          });
          UI.successSnackBar(
              message: "Your account has been created",
              title: "Successfully Created");
        } else {
          for (var element in data) {
            if (signupemailcontroller.text == element.email) {
              isSignUpLoading.value = false;
              UI.errorSnackBar(
                  message: "Your email already exit", title: "Email Error");
            } else {
              isValidSignUpEmail.value = false;
              isValidSignUpPassword.value = false;
              signUpEmailFocus.unfocus();
              signUpNamefocus.unfocus();
              signUpPasswordfocus.unfocus();

              final signUpBox = Boxes.auth();
              final saveData = HiveLoginModel(
                  email: signupemailcontroller.text,
                  name: signupnamecontroller.text,
                  password: signuppasswordcontroller.text);
              signUpBox.add(saveData);
              saveData.save();
              UI.successSnackBar(
                  message: "Your account has been created",
                  title: "Successfully Created");
              Timer(const Duration(seconds: 1), () {
                isSignUpLoading.value = false;

                currentIndex.value = 0;
              });
            }
          }
        }
      }
    } catch (e) {
      Get.log(e.toString());
    }
  }

  changeIndex(index) {
    currentIndex.value = index;
  }
}

mixin LoginControllerInitializer {
  var errorMessageForSignUpEmail;
  var errormessageForSignUpPassword;
  var errorMessageForLoginEmail;
  var errormessageForLoginPassword;
  final isLoginLoading = false.obs;
  final isSignUpLoading = false.obs;
  bool isLogin = false;
  HiveLoginModel? hiveLoginModel;
  final isValidLoginEmail = false.obs;
  final isValidLoginPassword = false.obs;
  final isValidSignUpEmail = false.obs;
  final isValidSignUpPassword = false.obs;
  final obscure = true.obs;
  final obscure1 = true.obs;
  final currentIndex = 0.obs;
  final loginEmailfocused = false.obs;
  final loginPaswordfocused = false.obs;
  final signUpEmailfocused = false.obs;
  final signUpPaswordfocused = false.obs;
  final signUpNamefocused = false.obs;

  final loginemailcontroller = TextEditingController();
  final loginpasswordcontroller = TextEditingController();
  final signupemailcontroller = TextEditingController();
  final signuppasswordcontroller = TextEditingController();
  final signupnamecontroller = TextEditingController();

  FocusNode loginEmailFocus = FocusNode();
  FocusNode loginPasswordfocus = FocusNode();
  FocusNode signUpEmailFocus = FocusNode();
  FocusNode signUpPasswordfocus = FocusNode();
  FocusNode signUpNamefocus = FocusNode();

  final GlobalKey<FormState> loginformkey = GlobalKey<FormState>();
  final GlobalKey<FormState> signupformkey = GlobalKey<FormState>();
}
