import 'package:ask_anything_app/app/core/widgets/button.dart';

import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_textstyles.dart';
import '../utils/size_utils.dart';

class LoginWidget extends StatelessWidget {
  final bool isLoading;
  final Widget loginEmailTexfield;
  final Widget loginpasswordTexfield;
  final VoidCallback? onlogin;
  final VoidCallback? onForgetPassword;
  final String? emailErrorText;
  final String? passwordErrorText;
  final bool isValidateEmail;
  final bool isValidatePassword;
  const LoginWidget({
    super.key,
    this.onlogin,
    this.onForgetPassword,
    required this.loginEmailTexfield,
    required this.loginpasswordTexfield,
    this.emailErrorText,
    this.passwordErrorText,
    this.isValidateEmail = false,
    this.isValidatePassword = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        loginEmailTexfield,
        isValidateEmail == true
            ? Padding(
                padding: getPadding(top: getVerticalSize(5)),
                child: Text(
                  emailErrorText!,
                  style: AppTextStyles.smallText
                      .copyWith(color: AppColors.errorColor),
                ),
              )
            : const SizedBox(),
        SizedBox(
          height: getVerticalSize(18),
        ),
        loginpasswordTexfield,
        isValidatePassword == true
            ? Padding(
                padding: getPadding(top: getVerticalSize(5)),
                child: Text(
                  passwordErrorText!,
                  style: AppTextStyles.smallText
                      .copyWith(color: AppColors.errorColor),
                ),
              )
            : const SizedBox(),
        SizedBox(
          height: getVerticalSize(40),
        ),
        button(
          isLoading: isLoading,
          text: "LOGIN",
          ontap: onlogin,
        ),
        // SizedBox(
        //   height: getVerticalSize(46),
        // ),
        // Align(
        //   alignment: Alignment.center,
        //   child: InkWell(
        //     onTap: onForgetPassword,
        //     child: Text("Forgot Password?",
        //         style: AppTextStyles.miniMediumText.copyWith(
        //             color: AppColors.primaryColor,
        //             fontWeight: FontWeight.w500)),
        //   ),
        // ),
      ],
    );
  }
}
