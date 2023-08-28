import 'package:hive/hive.dart';
part 'hive_dashboard_model.g.dart';

@HiveType(typeId: 0)
class HiveDashboardModel extends HiveObject {
  @HiveField(0)
  int index;
  @HiveField(1)
  String question;
  @HiveField(2)
  String response;
   @HiveField(3)
  String date;
   @HiveField(4)
  String time;
  HiveDashboardModel(
      {required this.question, required this.response, required this.index,required this.date, required this.time});
}
