import 'package:get/get.dart';
import 'package:flutter/material.dart';

class RootController extends GetxController with RootInitializer {}

mixin RootInitializer {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final scaffoldKey = GlobalKey<ScaffoldState>();
}
