// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:ask_anything_app/app/core/utils/hive_boxes.dart';

import 'package:ask_anything_app/app/modules/dashboard/model/hive_dashboard_model/hive_dashboard_model.dart';
import 'package:ask_anything_app/app/modules/dashboard/model/hive_save_model/hive_save_model.dart';
import 'package:ask_anything_app/app/routes/app_routes.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:intl/intl.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_textstyles.dart';
import '../../../core/utils/size_utils.dart';
import '../../../core/widgets/custom_chat_container.dart';
import '../model/dashboard_model.dart';
import '../repository/dashboard_repository.dart';

class DashboardController extends GetxController
    with DashboardControllerInitailzer {
  @override
  void onInit() {
    checkConnectivity();

    chatScrollController.addListener(() {
      handleScrollEvent();
    });
    super.onInit();
  }

  @override
  void dispose() {
    subscription.cancel();
    chatController.dispose();
    chatScrollController.dispose();

    focusNode.dispose();
    super.dispose();
  }

  onSave(index, BuildContext context) {
    final datePicker = DateFormat("dd/MM/yyyy").format(DateTime.now());
    final timePicker = TimeOfDay.now().format(context);

    final box = Boxes.auth();
    if (box.values.isNotEmpty) {
      final existingBox =
          chatResponse.firstWhereOrNull((item) => item.index == index);

      try {
        if (existingBox != null &&
            selectedIndexes.contains(index) &&
            box.values.isNotEmpty) {
          final box = Boxes.getData();

          selectedIndexes.remove(index);
          chatResponse.remove(existingBox);
          box.delete(existingBox.key);
        } else {
          final saveBox = HiveDashboardModel(
            time: timePicker,
            date: datePicker,
            index: index,
            question: messages[index].title.toString(),
            response: messages[index].discription.toString(),
          ).obs;

          selectedIndexes.add(index);
          final box = Boxes.getData();
          box.add(saveBox.value);
          chatResponse.add(saveBox.value);
          saveBox.value.save();
        }
      } catch (e) {
        Get.log(e.toString());
      }
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }

  onSendButton(TextEditingController controller, BuildContext context) async {
    try {
      if (controller.text == "") {
        onpress.value = false;
        check.value = false;
      } else {
        onpress.value = true;

        final input = controller.text;

        controller.clear();
        focusNode.unfocus();

        model = await Repo.fetchRecord(input);
        if (model!.data!.isEmpty) {
          Get.log("error occur");
        } else {
          final datePicker = DateFormat("dd/MM/yyyy").format(DateTime.now());
          final timePicker = TimeOfDay.now().format(context);

          messages.add(custom_chat_container(
            title: input,
            discription: model!.data.toString(),
          ));

          final savebox = Boxes.saveData();
          final savedata = HiveSaveModel(
              question: input,
              response: model!.data.toString(),
              date: datePicker,
              time: timePicker);

          savebox.add(savedata);
          savedata.save();

          Get.log(messages.length.toString());
          onpress.value = false;
        }
        scrollEvent();
      }
    } catch (e) {
      onpress.value = false;
      internetDailoge(title: "Error", msg: e.toString());
    } finally {
      onpress.value = false;
      scrollEvent();
    }
  }

  scrollEvent() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (chatScrollController.hasClients) {
        chatScrollController
            .jumpTo(chatScrollController.position.maxScrollExtent);

        update();
      }
    });
  }

  handleScrollEvent() {
    if (chatScrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (!isTopHide.value) {
        isTopHide.value = true;
        update();
      }
    } else if (chatScrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (isTopHide.value) {
        isTopHide.value = false;
        update();
      }
    }
  }

  onCopy(index) {
    final existingBox =
        chatResponse.firstWhereOrNull((item) => item.index == index);
    if (existingBox != null && selectedIndexes2.contains(index)) {
      selectedIndexes2.remove(index);
      const copyText = ClipboardData(text: "");
      Clipboard.setData(copyText);
    } else {
      final copyText =
          ClipboardData(text: messages[index].discription.toString());
      Clipboard.setData(copyText);
      selectedIndexes2.add(index);
    }
  }

  checkConnectivity() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      isConnected = await InternetConnectionChecker().hasConnection;
      if (!isConnected && isAlertBox.value == false) {
        await internetDailoge();
        isAlertBox.value = true;
      }
    });
  }

  internetDailoge(
      {String title = "No Connection",
      String msg = "Please check your internet connection"}) {
    Get.defaultDialog(
      radius: getSize(15),
      titlePadding:
          getPadding(top: getVerticalSize(30), bottom: getVerticalSize(15)),
      contentPadding:
          getPadding(left: getHorizontalSize(12), right: getHorizontalSize(12)),
      title: title,
      titleStyle:
          AppTextStyles.miniMediumText.copyWith(color: AppColors.primaryColor),
      content: Text(
        msg,
        textAlign: TextAlign.center,
        style: AppTextStyles.miniMediumText,
      ),
      actions: [
        Padding(
          padding: getPadding(all: getSize(10)),
          child: ElevatedButton(
              onPressed: () async {
                Get.back();
                isAlertBox.value = false;
                isConnected = await InternetConnectionChecker().hasConnection;
                if (!isConnected) {
                  await internetDailoge();
                  isAlertBox.value = true;
                }
              },
              child: Text(
                "Ok",
                style: AppTextStyles.mediumText
                    .copyWith(color: AppColors.whiteColor),
              )),
        )
      ],
    );
  }

  Future<bool> onWillPop() async {
    if (!_onBackPressedCompleter.isCompleted) {
      await Get.defaultDialog(
        title: "Close App",
        titleStyle: AppTextStyles.miniMediumText
            .copyWith(color: AppColors.primaryColor),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Do you want to close the app?",
              style: AppTextStyles.miniMediumText,
            ),
            SizedBox(
              height: getVerticalSize(15),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    _onBackPressedCompleter.complete(false);
                    Get.back();
                  },
                  child: Container(
                    width: getHorizontalSize(100),
                    height: getVerticalSize(50),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(getSize(10)),
                    ),
                    child: Center(
                      child: Text("No",
                          style: AppTextStyles.smallText.copyWith(
                            color: AppColors.whiteColor,
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  width: getHorizontalSize(10),
                ),
                GestureDetector(
                  onTap: () {
                    _onBackPressedCompleter.complete(true);
                    Get.back();
                  },
                  child: Container(
                    width: getHorizontalSize(100),
                    height: getVerticalSize(50),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(getSize(10)),
                    ),
                    child: Center(
                      child: Text("Yes",
                          style: AppTextStyles.smallText.copyWith(
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }
    return _onBackPressedCompleter.future;
  }
}

mixin DashboardControllerInitailzer {
  final _onBackPressedCompleter = Completer<bool>();
  FocusNode focusNode = FocusNode();
  DashboardModel? model;
  var isTopHide = false.obs;

  final check = false.obs;

  final onpress = false.obs;
  RxList<custom_chat_container> messages = RxList<custom_chat_container>([]);
  final chatController = TextEditingController();
  ScrollController chatScrollController = ScrollController();
  RxList<int> selectedIndexes = RxList<int>([]);

  RxList<HiveDashboardModel> chatResponse = RxList<HiveDashboardModel>([]);
  RxList<int> selectedIndexes2 = RxList<int>([]);
  late StreamSubscription subscription;
  var isConnected = false;
  var isAlertBox = false.obs;
}
