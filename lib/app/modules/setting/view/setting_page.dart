import 'package:ask_anything_app/app/core/widgets/responsive_widget.dart';

import 'package:flutter/material.dart';

import 'mobile_view/Setting_screen.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: const ResponsiveWidget(
          smallscreen: SettingScreen(),
        ),
      ),
    );
  }
}
