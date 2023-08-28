import 'package:ask_anything_app/app/core/widgets/responsive_widget.dart';
import 'package:ask_anything_app/app/modules/questions/controller/questions_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/custom_appbar.dart';
import 'mobile_view/questions_screen.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QuestionController());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CuatomAppbar(
        title: " Saved Questions",
        onBack: () {
          controller.goBack();
        },
        onDatePicker: () {
          controller.showdate(context: context);
        },
      ),
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: ResponsiveWidget(
          smallscreen: QuestionScreen(),
        ),
      ),
    );
  }
}
