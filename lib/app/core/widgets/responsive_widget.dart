import 'package:flutter/material.dart';

const int largeScreenSize = 1366;
const int mediumScreenSize = 768;
const int smallScreenSize = 360;
const int customScreenSize = 1100;

class ResponsiveWidget extends StatelessWidget {
  final Widget? smallscreen;
  final Widget? mediumscreen;
  final Widget? largescreen;
  final Widget? customscreen;
  const ResponsiveWidget(
      {super.key,
      this.smallscreen,
      this.mediumscreen,
      this.largescreen,
      this.customscreen});
  static bool issmallscreen(BuildContext context) {
    return MediaQuery.of(context).size.width < mediumScreenSize;
  }

  static bool ismediumscreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= mediumScreenSize &&
        MediaQuery.of(context).size.width < largeScreenSize;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > largeScreenSize;
  }

  static bool isCustomSize(BuildContext context) {
    return MediaQuery.of(context).size.width <= customScreenSize &&
        MediaQuery.of(context).size.width >= mediumScreenSize;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= largeScreenSize) {
        return largescreen!;
      } else if (constraints.maxWidth < largeScreenSize &&
          constraints.maxWidth >= mediumScreenSize) {
        return mediumscreen ?? largescreen ?? smallscreen!;
      } else {
        return smallscreen!;
      }
    });
  }
}
