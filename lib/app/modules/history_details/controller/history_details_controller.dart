// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryDetailsController extends GetxController
    with HistoryDetailsInitializer {
  @override
  void onInit() {
    showDataList = Get.arguments;

    super.onInit();
  }

 void scrollToTop() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });
  }
}

mixin HistoryDetailsInitializer {
  var showDataList;
  ScrollController scrollController = ScrollController();
}
