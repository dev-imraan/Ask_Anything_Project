import 'package:ask_anything_app/app/core/widgets/responsive_widget.dart';

import 'package:flutter/material.dart';

import 'mobile_view/login_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: const ResponsiveWidget(
          smallscreen: LoginScreen(),
        ),
      ),
    );
  }
}
