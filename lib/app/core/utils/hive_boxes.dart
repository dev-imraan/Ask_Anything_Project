import 'package:ask_anything_app/app/modules/dashboard/model/hive_dashboard_model/hive_dashboard_model.dart';
import 'package:hive/hive.dart';

import '../../modules/dashboard/model/hive_save_model/hive_save_model.dart';
import '../../modules/login/model/hive_login_model.dart';

class Boxes {
  static createBoxes() async {
    Hive.registerAdapter(HiveLoginModelAdapter());
    await Hive.openBox<HiveLoginModel>("Auth");

    Hive.registerAdapter(HiveDashboardModelAdapter());

    await Hive.openBox<HiveDashboardModel>("storeResponse");
    Hive.registerAdapter(HiveSaveModelAdapter());
    await Hive.openBox<HiveSaveModel>("SaveAll");
    await Hive.openBox<bool>("onbording");
  }

  static Box<HiveDashboardModel> getData() => Hive.box("storeResponse");
  static Box<HiveSaveModel> saveData() => Hive.box("SaveAll");
  static Box<bool> onbording() => Hive.box("onbording");

  static Box<HiveLoginModel> auth() => Hive.box("Auth");
}
