import 'package:ask_anything_app/app/modules/root/controller/root_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/responsive_widget.dart';


class RootScreen extends GetView<RootController> {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<RootController>(
        init: RootController(),
        builder: (_) => Scaffold(
              key: controller.scaffoldKey,
              resizeToAvoidBottomInset: false,
             
              body: ResponsiveWidget(
                smallscreen: Navigator(
                  key: controller.navigatorKey,
                  initialRoute: "",
                ),
              ),
            ));
  }
}
