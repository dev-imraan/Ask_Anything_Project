// ignore_for_file: prefer_const_constructors

import 'package:ask_anything_app/app/modules/dashboard/view/dashboard_page.dart';
import 'package:ask_anything_app/app/modules/history/view/history_page.dart';
import 'package:ask_anything_app/app/modules/login/view/login_page.dart';
import 'package:ask_anything_app/app/modules/onbording/veiw/onbording_page.dart';
import 'package:ask_anything_app/app/modules/questions/view/question_page.dart';
import 'package:ask_anything_app/app/modules/setting/view/setting_page.dart';

import 'package:ask_anything_app/app/routes/app_routes.dart';
import 'package:get/get.dart';

import '../modules/detail/view/details_page.dart';
import '../modules/forget/view/forget_page.dart';
import '../modules/history_details/view/history_details_page.dart';
import '../modules/otp/view/otp_page.dart';
import '../modules/reset/view/reset_page.dart';
import '../modules/root/guard/root_guard.dart';

class AppPages extends AppRoutes {
  static final pages = [
    GetPage(
      name: AppRoutes.initail,
      page: () => const OnbordingPage(),
      middlewares: [RouteGuard()],
    ),
    GetPage(name: AppRoutes.onbording, page: () => OnbordingPage()),
    GetPage(name: AppRoutes.login, page: () => LoginPage()),
    GetPage(name: AppRoutes.forget, page: () => ForgetPage()),
    GetPage(name: AppRoutes.otp, page: () => OtpPage()),
    GetPage(name: AppRoutes.reset, page: () => ResetPage()),
    GetPage(
        name: AppRoutes.dashboard,
        page: () => DashboardPage(),
        middlewares: [DashBoardGard()]),
    GetPage(name: AppRoutes.question, page: () => QuestionPage()),
    GetPage(name: AppRoutes.details, page: () => DetailPage()),
    GetPage(name: AppRoutes.history, page: () => HistoryPage()),
    GetPage(name: AppRoutes.setting, page: () => SettingPage()),
    GetPage(name: AppRoutes.historydetails, page: () => HistoryDetailsPage()),
  ];
}
