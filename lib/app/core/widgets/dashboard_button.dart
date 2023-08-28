// ignore_for_file: prefer_typing_uninitialized_variables, depend_on_referenced_packages

import 'package:ask_anything_app/app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../utils/size_utils.dart';

class DashboardButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback ontap;
  const DashboardButton({Key? key, required this.ontap, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: getHorizontalSize(31),
        height: getVerticalSize(31),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(getSize(7)),
            color: AppColors.primaryLiteColor),
        child: icon,
      ),
    );
  }
}
