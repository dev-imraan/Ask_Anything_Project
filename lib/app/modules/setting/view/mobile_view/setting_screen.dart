// ignore_for_file: deprecated_member_use

import 'package:ask_anything_app/App/core/utils/app_textstyles.dart';
import 'package:ask_anything_app/app/core/assets/app_icons.dart';
import 'package:ask_anything_app/app/core/assets/app_images.dart';
import 'package:ask_anything_app/app/core/utils/app_colors.dart';
import 'package:ask_anything_app/app/core/widgets/custom_bg.dart';
import 'package:ask_anything_app/app/routes/app_routes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/size_utils.dart';
import '../../../../core/widgets/row_conatiner.dart';
import '../../controller/setting_controller.dart';

class SettingScreen extends GetView<SettingController> {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      init: SettingController(),
      builder: (controller) => CustomImageContainer(
        imgpath: AppImages.bg2,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(children: [
              Container(
                  height: getVerticalSize(270),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(getSize(25)),
                          bottomRight: Radius.circular(getSize(25))),
                      image: const DecorationImage(
                          image: AssetImage(AppImages.setting_bg),
                          fit: BoxFit.cover)),
                  child: Column(
                    children: [
                      Padding(
                        padding: getPadding(
                            top: getVerticalSize(27),
                            left: getHorizontalSize(1)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: () {
                                Get.back();
                                // Get.toNamed(AppRoutes.dashboard);
                              },
                              child: SvgPicture.asset(
                                AppIcons.arrow,
                                color: AppColors.whiteColor,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getVerticalSize(10),
                      ),
                      Container(
                        height: getVerticalSize(100),
                        width: getHorizontalSize(100),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage(
                            AppImages.smalllogo2,
                          ),
                        )),
                      ),
                      SizedBox(
                        height: getVerticalSize(19),
                      ),
                      Obx(
                        () => Text(controller.name.value,
                            style: AppTextStyles.largeText!.copyWith(
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.w900,
                                fontSize: getFontSize(25))),
                      ),
                      Obx(
                        () => Text(controller.email.value,
                            style: AppTextStyles.smallText
                                .copyWith(color: AppColors.whiteColor)),
                      ),
                    ],
                  )),
              SizedBox(
                height: getVerticalSize(44),
              ),
              SettingRowContainer(
                title: "History",
                prefixIconPath: AppIcons.history,
                ontap: () {
                  Get.toNamed(AppRoutes.history);
                },
              ),
              // SizedBox(
              //   height: getVerticalSize(12),
              // ),
              // SettingRowContainer(
              //   title: "Change Password",
              //   prefixIconPath: AppIcons.lock,
              //   ontap: () {
              //     Get.offAllNamed(AppRoutes.reset);
              //   },
              // ),
              SizedBox(
                height: getVerticalSize(12),
              ),
              Obx(
                () => controller.email.value.isNotEmpty
                    ? Column(
                        children: [
                          SettingRowContainer(
                            title: "Logout",
                            prefixIconPath: AppIcons.logout,
                            ontap: () {
                              controller.isLogout();
                            },
                          ),
                          SizedBox(height: getVerticalSize(12)),
                        ],
                      )
                    : SizedBox(),
              ),
              SettingRowContainer(
                title: "Feedback",
                prefixIconPath: AppIcons.logout,
                ontap: () {},
              ),
              SizedBox(
                height: getVerticalSize(12),
              ),
              SettingRowContainer(
                title: "Privacy & Policy",
                prefixIconPath: AppIcons.logout,
                ontap: () {},
              ),
              // SizedBox(
              //   height: getVerticalSize(185),
              // ),
              //   Container(
              //     height: getVerticalSize(140),
              //     width: getHorizontalSize(285),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(15.sp),
              //       gradient: LinearGradient(
              //         colors: [
              //           AppColors.primaryLiteColor,
              //           AppColors.primaryColor
              //         ],
              //         stops: [0, 1],
              //         begin: Alignment(-0.00, -1.00),
              //         end: Alignment(0.00, 1.00),
              //       ),
              //       boxShadow: const [
              //         BoxShadow(
              //             color: Color(0x0d9087e5),
              //             offset: Offset(0, 6),
              //             blurRadius: 15,
              //             spreadRadius: 0)
              //       ],
              //     ),
              //     child: Column(children: [
              //       SizedBox(
              //         height: getVerticalSize(46),
              //       ),
              //       Text("UPGRADE TO PRO",
              //           style: AppTextStyles.miniMediumText.copyWith(
              //               color: AppColors.whiteColor,
              //               fontWeight: FontWeight.w500)),
              //       Padding(
              //         padding: EdgeInsets.only(
              //             left: getHorizontalSize(14),
              //             right: getHorizontalSize(14),
              //             top: getVerticalSize(7)),
              //         child: Text(
              //             "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate",
              //             textAlign: TextAlign.center,
              //             style: AppTextStyles.smallText
              //                 .copyWith(color: AppColors.whiteColor)),
              //       )
              //     ]),
              //   ),
              //   SizedBox(
              //     height: getVerticalSize(26),
              //   ),
              //   Text("Version 2.4.0",
              //       style: AppTextStyles.miniMediumText
              //           .copyWith(color: AppColors.accentColor)),
              // ]),
              // Positioned(
              //   top: getVerticalSize(562),
              //   child: Container(
              //     height: getVerticalSize(90),
              //     width: getHorizontalSize(90),
              //     decoration: BoxDecoration(
              //         border: Border.all(
              //             color: AppColors.whiteColor,
              //             width: getHorizontalSize(3)),
              //         color: AppColors.primaryColor,
              //         image: const DecorationImage(
              //           image: AssetImage(AppImages.minilogo),
              //         ),
              //         shape: BoxShape.circle),
              //   ),
            ]),
          ],
        ),
      ),
    );
  }
}
