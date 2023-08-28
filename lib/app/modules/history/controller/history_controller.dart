import 'package:ask_anything_app/app/core/utils/hive_boxes.dart';
import 'package:ask_anything_app/app/modules/dashboard/model/hive_save_model/hive_save_model.dart';
import 'package:ask_anything_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController with HistoryInitializer {
  @override
  void onInit() {
    getLoadHistory();
    super.onInit();
  }

  viewHistory(routes) {
    Get.toNamed(AppRoutes.historydetails, arguments: routes);
  }

  getLoadHistory() {
    final getdata = Boxes.saveData();
    final data = getdata.values.toList();
    _showRecord.assignAll(data);
  }

  Map<String, List<HiveSaveModel>> groupedMessageByDate() {
    Map<String, List<HiveSaveModel>> groupedMessages = {};
    for (var msg in showRecord) {
      final date = msg.date;
      if (groupedMessages.containsKey(date)) {
        groupedMessages[date]?.add(msg);
      } else {
        groupedMessages[date] = [msg];
      }
    }
    return groupedMessages;
  }

  void scrollToTop() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });
  }
}

mixin HistoryInitializer {
  final _showRecord = <HiveSaveModel>[].obs;
  List<HiveSaveModel> get showRecord => _showRecord;
  ScrollController scrollController = ScrollController();
}
