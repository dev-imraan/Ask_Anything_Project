import 'package:hive/hive.dart';
part 'hive_save_model.g.dart';

@HiveType(typeId: 2)
class HiveSaveModel extends HiveObject {
  @HiveField(1)
  String question;
  @HiveField(2)
  String response;
  @HiveField(3)
  String date;
  @HiveField(4)
  String time;
  HiveSaveModel(
      {required this.question,
      required this.response,
      required this.date,
      required this.time});
}
