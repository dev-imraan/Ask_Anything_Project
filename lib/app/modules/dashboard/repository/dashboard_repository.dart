import 'dart:convert';

import 'package:ask_anything_app/app/modules/dashboard/model/dashboard_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Repo {
  static DashboardModel? model;

  static Future<DashboardModel?> fetchRecord(String msg) async {
    final body = {"serachTerm": msg};
    try {
      final response = await http.post(
          Uri.parse("https://tvapp.owasoftltd.com/api/RecipeCreate"),
          headers: {
            "Content-Type": "application/json; charset=UTF-8",
          },
          body: jsonEncode(body));
      final data = json.decode(response.body);

      if (response.statusCode == 200) {
        model = DashboardModel.fromJson(data, msg);
        return model;
      }
    } catch (e) {
      // throw HttpException(e.toString());
      Get.log(e.toString());
      return null;
    }
    return model;
  }
}
// class TestingController extends GetxController {
//   TextEditingController msgController = TextEditingController(text: "testing");
//   TestingModel model = TestingModel();
//   fetchData() async {
//     final response = await http.post(
//       Uri.parse("https://tvapp.owasoftltd.com/api/RecipeCreate"),
//       body: jsonEncode(<String, dynamic>{
//         "serachTerm": msgController.text.toString(),
//       }),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//     );

//     if (response.statusCode == 200) {
//       model = TestingModel.fromJson(jsonDecode(response.body));
//       print(model.data.toString());
//     }
//   }
// }