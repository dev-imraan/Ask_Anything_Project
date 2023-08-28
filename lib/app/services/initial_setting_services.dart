// ignore_for_file: deprecated_member_use

import "dart:convert" as convert;

import 'package:ask_anything_app/app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ask_anything_app/app/global_model/initial_setting_model/initial_setting_model.dart';

import '../core/assets/constant.dart';
import '../core/utils/app_textstyles.dart';
import '../core/utils/ui.dart';

class InitialSettingServices extends GetxService {
  late Initial_Setting_Model settingmodel;
  Future<InitialSettingServices> init() async {
    final response = await getjsonfile(kInitialSettingJson);
    if (response != null) {
      settingmodel = Initial_Setting_Model.fromJson(response);
    }
    return this;
  }

  static Future<dynamic> getjsonfile(String path) async {
    return rootBundle.loadString(path).then(convert.jsonDecode);
  }

  ThemeMode getthememode() {
    if (settingmodel.defaultTheme == "dark") {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
          .copyWith(systemNavigationBarColor: Colors.black));
      return ThemeMode.dark;
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
          .copyWith(systemNavigationBarColor: Colors.white));
      return ThemeMode.light;
    }
  }

  ThemeData getLightTheme() {
    final lightTheme = settingmodel.lightTheme!;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.transParentColor,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: AppColors.transParentColor,
      statusBarIconBrightness: Brightness.dark,
    ));
    return ThemeData(
        primaryColor: UI.parseColor(lightTheme.primaryColor!),
        primaryColorDark: UI.parseColor(lightTheme.primaryDarkColor!),
        brightness: Brightness.light,
        dividerColor: UI.parseColor(
          lightTheme.liteGrayColor!,
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          shadowColor: AppColors.whiteColor,
          centerTitle: true,
          titleTextStyle: AppTextStyles.miniMediumText.copyWith(fontWeight: FontWeight.w500,fontSize: 17.sp,color: AppColors.whiteColor),
          toolbarHeight: 70.sp
          ),
        
        bottomSheetTheme: const BottomSheetThemeData(
          elevation: 0,
          backgroundColor: AppColors.transParentColor,
        ),
        focusColor: UI.parseColor(lightTheme.accentColor!),
        hintColor: UI.parseColor(lightTheme.liteGrayColor!),
        fontFamily: settingmodel.fontFamily,
        colorScheme: ColorScheme.light(
          primary: UI.parseColor(lightTheme.primaryColor!),
          secondary: UI.parseColor(lightTheme.accentColor!),
        ),
        scaffoldBackgroundColor: UI.parseColor(lightTheme.scaffoldColor!),
        textTheme: TextTheme(
          headline1: TextStyle(
              color: UI.parseColor(lightTheme.textColor!),
              fontWeight: FontWeight.w400,
              fontFamily: settingmodel.fontFamily,
              fontStyle: FontStyle.normal,
              fontSize: 12.sp),
          headline2: TextStyle(
              color: UI.parseColor(lightTheme.accentColor!),
              fontWeight: FontWeight.w400,
              fontFamily: settingmodel.fontFamily,
              fontStyle: FontStyle.normal,
              fontSize: 14.sp),
          headline3: TextStyle(
              color: UI.parseColor(lightTheme.textColor!),
              fontWeight: FontWeight.w400,
              fontFamily: settingmodel.fontFamily,
              fontStyle: FontStyle.normal,
              fontSize: 16.sp),
          headline4: TextStyle(
              color: UI.parseColor(lightTheme.textColor!),
              fontWeight: FontWeight.w700,
              fontFamily: settingmodel.fontFamily,
              fontStyle: FontStyle.normal,
              fontSize: 18.sp),
          headline5: TextStyle(
              color: UI.parseColor(lightTheme.textColor!),
              fontWeight: FontWeight.w700,
              fontFamily: settingmodel.fontFamily,
              fontStyle: FontStyle.normal,
              fontSize: 20.sp),
          headline6: TextStyle(
              color: UI.parseColor(lightTheme.textColor!),
              fontWeight: FontWeight.w700,
              fontFamily: settingmodel.fontFamily,
              fontStyle: FontStyle.normal,
              fontSize: 24.sp),
        ));
  }

  // ThemeData getDarkTheme() {
  //   final darkTheme = settingmodel.darkTheme!;
  //   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //     statusBarColor: UI.parseColor(darkTheme.primaryColor!),
  //     statusBarBrightness: Brightness.dark,
  //     systemNavigationBarColor: UI.parseColor(darkTheme.primaryColor!),
  //   ));
  //   return ThemeData(
  //     primaryColor: UI.parseColor(darkTheme.primaryColor!),
  //     primaryColorDark: UI.parseColor(darkTheme.primaryDarkColor!),
  //     brightness: Brightness.light,
  //     dividerColor: UI.parseColor(
  //       darkTheme.liteGrayColor!,
  //     ),
  //     focusColor: UI.parseColor(darkTheme.accentColor!),
  //     hintColor: UI.parseColor(darkTheme.liteGrayColor!),
  //     fontFamily: settingmodel.fontFamily,
  //     colorScheme: ColorScheme.light(
  //       primary: UI.parseColor(darkTheme.primaryColor!),
  //       secondary: UI.parseColor(darkTheme.accentColor!),
  //     ),
  //     scaffoldBackgroundColor: UI.parseColor(darkTheme.scaffoldColor!),
  //     textTheme: TextTheme(
  //         headline1: TextStyle(
  //             color: UI.parseColor(darkTheme.textColor!),
  //             fontWeight: FontWeight.w400,
  //             fontFamily: settingmodel.fontFamily,
  //             fontStyle: FontStyle.normal,
  //             fontSize:12.sp),
  //         headline2: TextStyle(
  //             color: UI.parseColor(darkTheme.accentColor!),
  //             fontWeight: FontWeight.w400,
  //             fontFamily: settingmodel.fontFamily,
  //             fontStyle: FontStyle.normal,
  //             fontSize: 14.sp),
  //         headline3: TextStyle(
  //             color: UI.parseColor(darkTheme.textColor!),
  //             fontWeight: FontWeight.w400,
  //             fontFamily: settingmodel.fontFamily,
  //             fontStyle: FontStyle.normal,
  //             fontSize: 16.sp),
  //         headline4: TextStyle(
  //             color: UI.parseColor(darkTheme.textColor!),
  //             fontWeight: FontWeight.w700,
  //             fontFamily: settingmodel.fontFamily,
  //             fontStyle: FontStyle.normal,
  //             fontSize: 18.sp),
  //         headline5: TextStyle(
  //             color:UI.parseColor(darkTheme.textColor!),
  //             fontWeight: FontWeight.w700,
  //             fontFamily: settingmodel.fontFamily,
  //             fontStyle: FontStyle.normal,
  //             fontSize: 20.sp),
  //             headline6: TextStyle(
  //             color:UI.parseColor(darkTheme.textColor!),
  //             fontWeight: FontWeight.w700,
  //             fontFamily: settingmodel.fontFamily,
  //             fontStyle: FontStyle.normal,
  //             fontSize: 24.sp),
  //       )

  //   );
  // }
}
