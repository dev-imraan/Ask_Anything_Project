import 'package:ask_anything_app/app/core/assets/app_images.dart';
import 'package:ask_anything_app/app/core/utils/app_colors.dart';
import 'package:ask_anything_app/app/core/utils/app_textstyles.dart';

import 'package:ask_anything_app/app/core/widgets/custom_bg.dart';

import 'package:ask_anything_app/app/modules/history/controller/history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/size_utils.dart';
import '../../../../core/widgets/custom_container_savequestions.dart';

class HistoryScreen extends GetView<UndoHistoryController> {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomImageContainer(
      imgpath: AppImages.bg2,
      child: GetBuilder<HistoryController>(
          init: HistoryController(),
          builder: (controller) {
            if (controller.showRecord.isEmpty) {
              return Center(
                  child: Text(
                "No chat history available",
                style: AppTextStyles.largeText!
                    .copyWith(color: AppColors.accentColor),
              ));
            } else {
              final gorupMessages = controller.groupedMessageByDate();
              controller.scrollToTop();

              return Column(
                children: [
                  Flexible(
                    child: ListView.builder(
                      reverse: true,
                      shrinkWrap: true,
                      controller: controller.scrollController,
                      itemCount: gorupMessages.length,
                      itemBuilder: (context, index) {
                        final dateList = gorupMessages.keys.toList();
                        final date = dateList[index];
                        final messagesOnData = gorupMessages[date];

                        // if (messagesOnData == null ||
                        //     messagesOnData.length <= index) {
                        //   // Handle the case where messagesOnData is null or index is out of range.
                        //   return SizedBox(); // You can return an empty widget or any fallback widget here.
                        // }

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: getVerticalSize(12),
                            ),
                            Text(
                              date,
                              style: AppTextStyles.mediumText,
                            ),
                            
                            ListView.builder(
                                controller: ScrollController(),
                                shrinkWrap: true,
                                itemCount: messagesOnData?.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: getPadding(
                                      top: getVerticalSize(14),
                                      left: getHorizontalSize(16),
                                      right: getHorizontalSize(16),
                                    ),
                                    child: custom_container(
                                      isResponseShow: true,
                                      ontap: () {},
                                      date: messagesOnData![index].date,
                                      discription:
                                          messagesOnData[index].response,
                                      time: messagesOnData[index].time,
                                      title: messagesOnData[index].question,
                                    ),
                                  );
                                })
                          ],
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          }),
    );
  }
}
