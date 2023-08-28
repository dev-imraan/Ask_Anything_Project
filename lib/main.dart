// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:ask_anything_app/app/core/utils/hive_boxes.dart';

import 'package:ask_anything_app/app/routes/app_routes.dart';
import 'package:ask_anything_app/app/services/initial_setting_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'app/core/strings/constant_strings.dart';

import 'app/routes/app_pages.dart';
import 'package:path_provider/path_provider.dart';

Future<void> _initailServices() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  Get.log("Starting Services ......");
  await Get.putAsync(() => InitialSettingServices().init());
  Get.log("Started Services");
}

Future<void> initHive() async {
  var directory = await getApplicationDocumentsDirectory();

  Hive.init(directory.path);
  Get.log(directory.path);
  await Boxes.createBoxes();
}

void main() async {
  await _initailServices();
  await initHive();
  final box = Boxes.onbording();

  onbordingStatus = box.get("show", defaultValue: true);

  runApp(const MyApp());
}

late var onbordingStatus;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: ScreenUtilInit(
            useInheritedMediaQuery: true,
            designSize: size,
            builder: (context, child) => GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  defaultTransition: Transition.fade,
                  themeMode: Get.find<InitialSettingServices>().getthememode(),
                  initialRoute:
                      onbordingStatus ? AppRoutes.initail : AppRoutes.dashboard,
                  getPages: AppPages.pages,
                  title: kAppName,
                  theme: Get.find<InitialSettingServices>().getLightTheme(),
                )));
  }
}
