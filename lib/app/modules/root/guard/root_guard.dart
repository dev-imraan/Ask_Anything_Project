import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';



class RouteGuard extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    Timer(const Duration(seconds: 1), () {
      FlutterNativeSplash.remove();
    });
    return null;
  }
}
class DashBoardGard extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    Timer(const Duration(seconds: 1), () {
      FlutterNativeSplash.remove();
    });
    return null;
  }
}


