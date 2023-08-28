// ignore: depend_on_referenced_packages

// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';

import 'package:ask_anything_app/app/core/utils/hive_boxes.dart';
import 'package:ask_anything_app/app/core/utils/progess_dailog.dart';

import 'package:ask_anything_app/app/modules/dashboard/model/hive_dashboard_model/hive_dashboard_model.dart';
import 'package:ask_anything_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:intl/intl.dart';

import '../../../core/utils/app_colors.dart';

class QuestionController extends GetxController
    with QuestionControllerInitializer {
  showdate({required context}) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget? child) {
        return Theme(
            data: ThemeData(
                colorScheme:
                    ColorScheme.fromSeed(seedColor: AppColors.primaryColor)),
            child: child!);
      },
    ).then((selectedDate) {
      if (selectedDate != null) {
        searchDate = DateFormat("dd/MM/yyyy").format(selectedDate);
        isSearching.value = true;
        ProgressDialogUtils.showProgressDialog();
        isError.value = false;
        onSearchData();
      }
    });
  }

  onSearchData() {
    var box = Boxes.getData();
    final List<HiveDashboardModel> data =
        box.values.toList().cast<HiveDashboardModel>();

    final filteredData =
        data.where((element) => element.date == searchDate).toList().obs;

    if (filteredData.isNotEmpty) {
      ProgressDialogUtils.hideProgressDialog();
      selectedData.assignAll(filteredData);
    } else {
      Timer(const Duration(seconds: 1), () {
        ProgressDialogUtils.hideProgressDialog();
        isError.value = true;
      });
      selectedData.clear();
    }
  }

  goBack() {
    if (isError.value == true) {
      isSearching.value = false;
      isError.value = false;
    } else {
      return Get.back();
    }
  }

  viewDetails(route) {
    Get.toNamed(AppRoutes.details, arguments: route);
  }

  void scrollToTop() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });
  }
}

mixin QuestionControllerInitializer {
  var isSearch = false;
  final currentIndex = 0.obs;
  var searchDate;
  final List selectedData = [].obs;
  final isSearching = false.obs;
  final isError = false.obs;
  ScrollController scrollController = ScrollController();
}
