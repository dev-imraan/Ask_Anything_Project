// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../assets/app_icons.dart';
import '../assets/app_images.dart';
import '../utils/app_colors.dart';
import '../utils/size_utils.dart';

class CuatomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? onBack;
  final bool action;
  final VoidCallback? onDatePicker;
  const CuatomAppbar(
      {super.key,
      this.title,
      this.onBack,
      this.onDatePicker,
      this.action = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Image.asset(
        AppImages.appbar_bg,
        fit: BoxFit.cover,
      ),
      title: Text(
        title!,
      ),
      leading: TextButton(
        onPressed: onBack,
        child: SvgPicture.asset(
          AppIcons.arrow,
          fit: BoxFit.scaleDown,
          color: AppColors.whiteColor,
        ),
      ),
      actions: [
        action == true
            ? TextButton(
                onPressed: onDatePicker,
                child: SvgPicture.asset(
                  AppIcons.calender,
                  fit: BoxFit.scaleDown,
                  color: AppColors.whiteColor,
                ),
              )
            : const SizedBox(),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(getVerticalSize(70));
}
