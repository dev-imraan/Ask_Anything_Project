// ignore_for_file: depend_on_referenced_packages, use_key_in_widget_constructors
import 'package:ask_anything_app/app/core/assets/app_images.dart';
import 'package:ask_anything_app/app/modules/dashboard/model/hive_dashboard_model/hive_dashboard_model.dart';
import 'package:ask_anything_app/app/modules/questions/controller/questions_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_textstyles.dart';
import '../../../../core/utils/hive_boxes.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../core/widgets/custom_bg.dart';
import '../../../../core/widgets/custom_container_savequestions.dart';

class QuestionScreen extends GetView<QuestionController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
      init: QuestionController(),
      builder: (controller) => CustomImageContainer(
          imgpath: AppImages.bg2,
          child: Column(
            children: [
              Flexible(
                child: ValueListenableBuilder<Box<HiveDashboardModel>>(
                    valueListenable: Boxes.getData().listenable(),
                    builder: (context, box, _) {
                      var data = box.values.toList().cast<HiveDashboardModel>();
                      controller.scrollToTop();
                      return Obx(
                        () => controller.isSearching.value == false
                            ? ListView.builder(
                                shrinkWrap: true,
                                reverse: true,
                                controller: controller.scrollController,
                                physics: const BouncingScrollPhysics(),
                                itemCount: box.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: getPadding(
                                      top: getVerticalSize(14),
                                      left: getHorizontalSize(16),
                                      right: getHorizontalSize(16),
                                    ),
                                    child: (custom_container(
                                      ontap: () {
                                        controller.viewDetails(data[index]);
                                      },
                                      date: data[index].date,
                                      discription: data[index].response,
                                      time: data[index].time,
                                      title: data[index].question,
                                    )),
                                  );
                                })
                            : !controller.isError.value
                                ? ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: controller.selectedData.length,
                                    itemBuilder: (context, index) => Padding(
                                          padding: getPadding(
                                            top: getVerticalSize(14),
                                            left: getHorizontalSize(16),
                                            right: getHorizontalSize(16),
                                          ),
                                          child: (custom_container(
                                            ontap: () {
                                              controller.viewDetails(controller
                                                  .selectedData[index]);
                                            },
                                            date: controller
                                                .selectedData[index].date,
                                            discription: controller
                                                .selectedData[index].response,
                                            time: controller
                                                .selectedData[index].time,
                                            title: controller
                                                .selectedData[index].question,
                                          )),
                                        ))
                                : Center(
                                    child: Text(
                                      "Data Not Found",
                                      style: AppTextStyles.largeText!.copyWith(
                                          color: AppColors.accentColor),
                                    ),
                                  ),
                      );
                    }),
              ),
            ],
          )),
    );
  }
}
