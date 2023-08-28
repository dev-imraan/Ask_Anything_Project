import 'package:ask_anything_app/app/core/utils/hive_boxes.dart';

import 'package:ask_anything_app/app/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class SettingController extends GetxController
    with SettingControllerInitializer {
  @override
  void onInit() async {
    await getDetails();
    super.onInit();
  }

  isLogout() async {
    var box = await Hive.openBox("info");
    box.put("email", "");
    box.put("name", "");
    var logoutBox = Boxes.auth();
    logoutBox.clear();

    var clearHistory = Boxes.getData();
    clearHistory.clear();
    var historyBox = Boxes.saveData();
    historyBox.clear();

    Get.offAllNamed(AppRoutes.dashboard);
  }

  getDetails() async {
    var box = await Hive.openBox("info");
    final getEmail = box.get("email");
    final getName = box.get("name");
    email.value = getEmail;
    name.value = getName;
  }
}

mixin SettingControllerInitializer {
  final email = "".obs;
  final name = "".obs;
  
}
