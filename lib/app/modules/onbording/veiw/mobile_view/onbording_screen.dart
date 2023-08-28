import 'package:ask_anything_app/app/core/assets/app_images.dart';
import 'package:ask_anything_app/app/core/utils/app_colors.dart';
import 'package:ask_anything_app/app/core/utils/app_textstyles.dart';
import 'package:ask_anything_app/app/core/widgets/button.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/onbordingList.dart';
import '../../../../core/widgets/build_dot.dart';
import '../../../../core/widgets/custom_bg.dart';
import '../../../../routes/app_routes.dart';
import '../../controller/onbording_controller.dart';

class OnbordingScreen extends GetView<OnbordingController> {
  const OnbordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<OnbordingController>(
      init: OnbordingController(),
      builder: (_) => CustomImageContainer(
          imgpath: AppImages.bg,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: size.height / 16.7, right: size.width / 23),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        controller.completeOnbording();
                        Get.offAllNamed(AppRoutes.dashboard);
                      },
                      child: Text("SKIP",
                          style: AppTextStyles.miniMediumText
                              .copyWith(color: AppColors.primaryColor)),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height / 30,
              ),
              SizedBox(
                height: size.height / 1.6,
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: controller.pageController,
                  itemCount: onbordingslider.length,
                  onPageChanged: (index) {
                    controller.currentIndex.value = index;
                  },
                  itemBuilder: (_, i) {
                    return Column(children: [
                      Align(
                          alignment: Alignment.center,
                          child: Text(onbordingslider[i].title,
                              style: AppTextStyles.largeText)),
                      SizedBox(
                        height: size.height / 82.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: size.width / 11, left: size.width / 11),
                        child: Text(onbordingslider[i].discription,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.smallText
                                .copyWith(color: AppColors.accentColor)),
                      ),
                      SizedBox(
                        height: size.height / 15,
                      ),
                      Container(
                        width: size.width / 1.5,
                        height: size.height / 2.9,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                          onbordingslider[i].img,
                        ))),
                      )
                    ]);
                  },
                ),
              ),
              SizedBox(
                height: size.height / 18.6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          onbordingslider.length,
                          (index) => BuildDot().buildDot(
                              index: index,
                              context: context,
                              currentIndex: controller.currentIndex.value)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height / 18,
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: size.width / 11, left: size.width / 11),
                child: button(
                  ontap: () {
                    controller.onButtonPress();
                  },
                  text: "Next",
                ),
              )
            ],
          )),
    );
  }
}
