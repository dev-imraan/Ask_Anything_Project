// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../core/utils/onbordingList.dart';
import '../../../routes/app_routes.dart';

class OnbordingController extends GetxController
    with OnbordingControllerInitializer {
  @override
  void onInit() {
    loadOnBording();
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  loadOnBording() async {
    final onbordingBox = await Hive.openBox<bool>("onbording");
    showOnbording.value = onbordingBox.get("show", defaultValue: true)!;
  }

  completeOnbording() async {
    final onbordingBox = await Hive.openBox<bool>("onbording");
    onbordingBox.put("show", false);
    showOnbording.value = false;
  }

  onButtonPress() {
    if (currentIndex.value == onbordingslider.length - 1) {
       completeOnbording();
      Get.offAllNamed(AppRoutes.dashboard);
    }
    pageController.nextPage(
      duration: const Duration(milliseconds: 50),
      curve: Curves.ease,
    );
  }
}

mixin OnbordingControllerInitializer {
  final showOnbording = true.obs;
  final currentIndex = 0.obs;
  final index = 0.obs;

  PageController pageController = PageController();
}
