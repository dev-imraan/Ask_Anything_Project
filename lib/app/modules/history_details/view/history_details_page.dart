import 'package:ask_anything_app/app/core/widgets/responsive_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/custom_appbar.dart';
import 'mobile_view/history_details_screen.dart';

class HistoryDetailsPage extends StatelessWidget {
  const HistoryDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: CuatomAppbar(
        action: false,
        title: "History",
        onBack: () {
          Get.back();
        },
      ),
      body: SizedBox(
        height: size,
        child: const ResponsiveWidget(
          smallscreen: HistoryDetailsScreen(),
        ),
      ),
    );
  }
}
