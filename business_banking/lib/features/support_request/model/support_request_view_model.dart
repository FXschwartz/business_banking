import 'package:clean_framework/clean_framework.dart';

class SupportRequestViewModel extends ViewModel {
  final List<SupportRequest> allSupportRequests;

  SupportRequestViewModel({
    required this.allSupportRequests,
  });

  @override
  List<Object?> get props => [
        allSupportRequests,
      ];
}

class SupportRequest {
  final String title;
  final String body;
  final String email;

  SupportRequest({
    required this.title,
    required this.body,
    required this.email,
  });

  SupportRequest.fromJson(Map<String, dynamic> json)
      : title = json['title'] ?? '',
        body = json['body'] ?? '',
        email = json['email'] ?? '';
}
