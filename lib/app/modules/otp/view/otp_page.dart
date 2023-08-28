import 'package:ask_anything_app/app/core/widgets/responsive_widget.dart';
import 'package:ask_anything_app/app/modules/otp/view/mobile_view/otp_screen.dart';

import 'package:flutter/material.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: const ResponsiveWidget(
          smallscreen: OtpScreen(),
        ),
      ),
    );
  }
}
