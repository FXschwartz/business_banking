import 'package:clean_framework/clean_framework.dart';

class SupportRequestViewModel extends ViewModel {
  final String title;
  final String body;
  final String email;

  SupportRequestViewModel({
    required this.title,
    required this.body,
    required this.email,
  });

  @override
  List<Object?> get props => [
        title,
        body,
        email,
      ];
}
