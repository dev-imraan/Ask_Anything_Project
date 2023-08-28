import 'package:ask_anything_app/app/core/widgets/button.dart';

import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_textstyles.dart';
import '../utils/size_utils.dart';

class SignUpWidget extends StatelessWidget {
  final Widget signUpEmailTexfield;
  final Widget signUppasswordTexfield;
  final Widget signUpNameTextfield;
  final VoidCallback? onSignup;
  final String? emailErrorText;
  final String? passwordErrorText;
  final bool isValidateEmail;
  final bool isValidatePassword;
  final bool isLoading;

  const SignUpWidget(
      {super.key,
      this.onSignup,
      required this.signUpEmailTexfield,
      required this.signUppasswordTexfield,
      required this.signUpNameTextfield,
      this.emailErrorText,
      this.passwordErrorText,
      this.isValidateEmail = false,
      this.isValidatePassword = false,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        signUpNameTextfield,
        SizedBox(
          height: getVerticalSize(18),
        ),
        signUpEmailTexfield,
        isValidateEmail && emailErrorText!.isNotEmpty
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
        signUppasswordTexfield,
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
          text: "SIGN UP",
          ontap: onSignup,
        ),
      ],
    );
  }
}
