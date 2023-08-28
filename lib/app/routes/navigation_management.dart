import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Navigation {
  static back({BuildContext? context}) {
    FocusScopeNode currentfocus =
        FocusScope.of(context ?? Get.key.currentContext!);
    if (!currentfocus.hasPrimaryFocus && currentfocus.focusedChild != null) {
      currentfocus.focusedChild!.unfocus();
      Get.back();
    } else {
      FocusManager.instance.primaryFocus?.unfocus();
      Get.back();
    }
  }

  static to(dynamic page, {dynamic arguments}) {
    return Get.to(page, arguments: arguments);
  }

  static toNamed(dynamic page,
      {dynamic arguments, Map<String, String>? parameter}) {
    return Get.toNamed(page, arguments: arguments, parameters: parameter);
  }

  static offNamed(dynamic page, {dynamic arguments}) {
    return Get.offNamed(page, arguments: arguments);
  }

  static offAllNamed(dynamic page, {dynamic arguments}) {
    return Get.offAllNamed(page, arguments: arguments);
  }
}
