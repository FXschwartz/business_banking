import 'package:clean_framework/clean_framework_defaults.dart';

class SupportRequestServiceResponseModel extends JsonResponseModel {
  final String title;
  final String body;
  final String email;

  SupportRequestServiceResponseModel.fromJson(Map<String, dynamic> json)
      : title = json['title'] ?? '',
        body = json['body'] ?? '',
        email = json['email'] ?? '';

  @override
  List<Object> get props => [
        title,
        body,
        email,
      ];
}
