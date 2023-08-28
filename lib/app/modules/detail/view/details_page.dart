import 'package:ask_anything_app/app/core/widgets/responsive_widget.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/widgets/custom_appbar.dart';
import 'mobile_view/Details_screen.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CuatomAppbar(
        action: false,
        title: "Details",
        onBack: () {
          Get.back();
        },
      ),
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: const ResponsiveWidget(
          smallscreen: DetailScreen(),
        ),
      ),
    );
  }
}
