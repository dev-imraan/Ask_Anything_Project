import 'package:ask_anything_app/app/core/widgets/responsive_widget.dart';

import 'package:flutter/material.dart';

import 'mobile_view/forget_screen.dart';

class ForgetPage extends StatelessWidget {
  const ForgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: const ResponsiveWidget(
          smallscreen: ForgetScreen(),
        ),
      ),
    );
  }
}
