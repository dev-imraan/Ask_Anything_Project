import 'package:ask_anything_app/app/core/assets/app_images.dart';
import 'package:ask_anything_app/app/core/widgets/custom_bg.dart';
import 'package:ask_anything_app/app/core/widgets/custom_container_savequestions.dart';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../core/utils/size_utils.dart';
import '../../controller/history_details_controller.dart';

class HistoryDetailsScreen extends GetView<HistoryDetailsController> {
  const HistoryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryDetailsController>(
        init: HistoryDetailsController(),
        builder: (_) {
          controller.scrollToTop();
          return CustomImageContainer(
            imgpath: AppImages.bg2,
            child: Column(
              children: [
                Flexible(
                  child: ListView.builder(
                      reverse: true,
                      shrinkWrap: true,
                      controller: controller.scrollController,
                      itemCount: controller.showDataList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: getPadding(
                            top: getVerticalSize(14),
                            left: getHorizontalSize(16),
                            right: getHorizontalSize(16),
                          ),
                          child: custom_container(
                            date: controller.showDataList[index].date,
                            time: controller.showDataList[index].time,
                            title: controller.showDataList[index].question,
                            discription:
                                controller.showDataList[index].response,
                          ),
                        );
                      }),
                ),
              ],
            ),
          );
        });
  }
}
