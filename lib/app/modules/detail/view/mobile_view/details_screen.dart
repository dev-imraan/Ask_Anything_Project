import 'package:ask_anything_app/app/core/assets/app_images.dart';

import 'package:ask_anything_app/app/core/widgets/button.dart';
import 'package:ask_anything_app/app/core/widgets/custom_container_savequestions.dart';
import 'package:ask_anything_app/app/modules/detail/controller/detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../../core/assets/app_icons.dart';
import '../../../../core/utils/app_colors.dart';

import '../../../../core/utils/size_utils.dart';
import '../../../../core/widgets/custom_bg.dart';

class DetailScreen extends GetView<DetailController> {
  @override
  const DetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      init: DetailController(),
      builder: (controller) => CustomImageContainer(
        imgpath: AppImages.bg2,
        child: Padding(
          padding: getPadding(
            top: getVerticalSize(14),
            left: getHorizontalSize(16),
            right: getHorizontalSize(16),
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(
                      parent: ScrollPhysics(parent: ClampingScrollPhysics())),
                  child: custom_container(
                      textOverflow: TextOverflow.clip,
                      maxlines: controller.routeDetails.response.length,
                      date: controller.routeDetails.date,
                      discription: controller.routeDetails.response,
                      time: controller.routeDetails.time,
                      title: controller.routeDetails.question),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: getVerticalSize(80),
                  width: getHorizontalSize(375),
                  color: AppColors.whiteColor,
                  child: Center(
                    child: Padding(
                        padding: getPadding(
                            right: getHorizontalSize(31),
                            left: getHorizontalSize(31)),
                        child: Obx(
                          () => button(
                            text: controller.onpress.value
                                ? "Copied!"
                                : "Copy Answer",
                            ontap: () {
                              controller.oncheck();
                            },
                            icon: controller.onpress.value
                                ? SvgPicture.asset(
                                    AppIcons.done2,
                                    fit: BoxFit.scaleDown,
                                  )
                                : SvgPicture.asset(
                                    AppIcons.copy,
                                  ),
                          ),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
