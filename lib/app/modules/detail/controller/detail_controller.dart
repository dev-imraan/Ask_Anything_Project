// ignore: depend_on_referenced_packages
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../dashboard/model/hive_dashboard_model/hive_dashboard_model.dart';

class DetailController extends GetxController with DetailControllerInitializer {
  @override
  void onInit() {
    final arguments = Get.arguments;
    routeDetails = arguments;

    super.onInit();
  }

  oncheck() {
    if (onpress.value == true) {
      const copyText = ClipboardData(text: "");
      Clipboard.setData(copyText);
      onpress.value = false;
    } else {
      onpress.value = true;
      final copyText = ClipboardData(text: routeDetails.response);
      Clipboard.setData(copyText);
    }
  }
}

mixin DetailControllerInitializer {
  final onpress = false.obs;
  final index = 0;
  late HiveDashboardModel routeDetails;
}
