import 'package:hive/hive.dart';
part 'hive_login_model.g.dart';

@HiveType(typeId: 1)
class HiveLoginModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String email;
  @HiveField(2)
  String password;
  HiveLoginModel(
      {required this.email, required this.name, required this.password});
}
