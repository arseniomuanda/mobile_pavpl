class BaseErrorModel {
  int? code;

  String? message;

  BaseErrorModel({this.code, this.message});

  BaseErrorModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }
}
