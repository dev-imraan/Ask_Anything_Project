// ignore_for_file: depend_on_referenced_packages, unrelated_type_equality_checks, deprecated_member_use

import 'package:ask_anything_app/app/core/widgets/custom_bottomsheet.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:ask_anything_app/app/modules/dashboard/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/assets/app_icons.dart';
import '../../../../core/assets/app_images.dart';
import '../../../../core/utils/app_colors.dart';

import '../../../../core/utils/size_utils.dart';
import '../../../../core/widgets/custom_chat_container.dart';
import '../../../../core/widgets/dashboard_button.dart';
import '../../../../routes/app_routes.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (controller) => WillPopScope(
        onWillPop: () => controller.onWillPop(),
        child: Stack(
          children: [
            Container(
              height: getVerticalSize(175),
              width: getHorizontalSize(375),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        AppImages.appbar_bg,
                      ),
                      fit: BoxFit.cover)),
              child: Padding(
                padding: getPadding(
                  left: getHorizontalSize(16),
                  right: getHorizontalSize(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: getVerticalSize(50),
                      width: getHorizontalSize(105),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(
                          AppImages.smalllogo,
                        ),
                      )),
                    ),
                    SizedBox(
                      child: Row(children: [
                        DashboardButton(
                          ontap: () {
                            Get.toNamed(AppRoutes.question);
                            controller.focusNode.unfocus();
                          },
                          icon: SvgPicture.asset(
                            AppIcons.save,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        SizedBox(
                          width: getHorizontalSize(10),
                        ),
                        DashboardButton(
                          ontap: () {
                            Get.toNamed(AppRoutes.setting);
                          },
                          icon: SvgPicture.asset(
                            AppIcons.setting,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: getPadding(top: getVerticalSize(121)),
              child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(getSize(23)),
                      topRight: Radius.circular(getSize(23)),
                    ),
                    image: const DecorationImage(
                        image: AssetImage(AppImages.bg2), fit: BoxFit.cover),
                  ),
                  child: Column(
                    children: [
                      Flexible(
                        child: SingleChildScrollView(
                          reverse: true,
                          child: SizedBox(
                            height: size.height / 1.3,
                            child: Obx(
                              () => Padding(
                                padding: getPadding(
                                    top: !controller.isTopHide.value
                                        ? getVerticalSize(20)
                                        : getVerticalSize(2)),
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    controller: controller.chatScrollController,
                                    padding: getPadding(all: 0),
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: controller.messages.length,
                                    itemBuilder: (context, index) {
                                      final lastitem = index ==
                                          controller.messages.length - 1;
                                      return Padding(
                                        padding: getPadding(
                                            bottom: lastitem
                                                ? getVerticalSize(20)
                                                : getVerticalSize(16)),
                                        child: Obx(
                                          () => custom_chat_container(
                                              title: controller
                                                  .messages[index].title,
                                              discription: controller
                                                  .messages[index].discription,
                                              copyButtonText: controller
                                                      .selectedIndexes2
                                                      .contains(index)
                                                  ? "Copied!"
                                                  : "Copy",
                                              saveButtonText:
                                                  controller.selectedIndexes.contains(index)
                                                      ? "Saved!"
                                                      : "Save",
                                              copyIconPath: controller
                                                      .selectedIndexes2
                                                      .contains(index)
                                                  ? AppIcons.done
                                                  : AppIcons.copy,
                                              saveIconPath:
                                                  controller.selectedIndexes.contains(index)
                                                      ? AppIcons.done
                                                      : AppIcons.save,
                                              OntapOncopy: () =>
                                                  controller.onCopy(index),
                                              OntapOnsave: () =>
                                                  controller.onSave(index, context),
                                              isYes: controller.messages.length - 1 == index ? true : false),
                                        ),
                                      );
                                    }),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => CustomChatTextfield(
                            onTap: () {
                              controller.scrollEvent();
                            },
                            onChanged: (value) {
                              value.isEmpty && value == ""
                                  ? controller.check.value = false
                                  : controller.check.value = true;
                            },
                            focusNode: controller.focusNode,
                            controller: controller.chatController,
                            hinttext: "Type anything you want to search...",
                            onpress: () {
                              controller.onSendButton(
                                  controller.chatController, context);
                            },
                            icon: controller.onpress.value
                                ? const SpinKitThreeBounce(
                                    color: Colors.white,
                                    size: 20.0,
                                  )
                                : SvgPicture.asset(AppIcons.send,
                                    color: controller.check.value
                                        ? AppColors.whiteColor
                                        : AppColors.liteGrayColor)),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
