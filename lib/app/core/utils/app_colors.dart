import 'package:ask_anything_app/app/core/utils/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/initial_setting_services.dart';

class AppColors {
  // static Color get whiteColor => parseColor("#fafafa");

  static const whiteColor = Colors.white;

  static const Color chatContainerColor = Color(0xffeaeaf5);
  static const Color shadowColor = Color(0x339087e5);
  static const fillColor = Color(0xfff6f6f6);

  static const Color errorColor = Color(0xffff2727);
  static const Color primaryLiteColor = Color(0xff8a7cef);
  static const transParentColor = Colors.transparent;
  static final primaryColor = Get.theme.primaryColor;

  static Color get blackColor => UI.parseColor(
      Get.find<InitialSettingServices>().settingmodel.lightTheme!.textColor!);
  static Color get liteGrayColor =>
      UI.parseColor(Get.find<InitialSettingServices>()
          .settingmodel
          .lightTheme!
          .liteGrayColor!);
  static Color get accentColor => UI.parseColor(
      Get.find<InitialSettingServices>().settingmodel.lightTheme!.accentColor!);
  static Color get scaffoldColor =>
      UI.parseColor(Get.find<InitialSettingServices>()
          .settingmodel
          .lightTheme!
          .scaffoldColor!);
}
