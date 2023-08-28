// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals

class DashboardModel {
  int? statusCode;
  String? message;
  String? status;
  String? data;
  String? question;
  DashboardModel({
    required this.data,
    required this.status,
    required this.statusCode,
    required this.message,
    required this.question,
  });
  DashboardModel.fromJson(Map<String, dynamic> json, String msg) {
    statusCode = json["statusCode"];
    status = json["status"];
    message = json["message"];
    data = json["data"];
    question = msg;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['status'] = this.status;
    data['message'] = this.message;
    data['data'] = this.data;
    
    return data;
  }
}
