import 'package:business_banking/features/support_request/model/support_request_view_model.dart';
import 'package:equatable/equatable.dart';

abstract class SupportRequestViewEvents extends Equatable {}

class SupportRequestViewUpdateRequestEvent extends SupportRequestViewEvents {
  final String title;
  final String email;
  final String body;

  SupportRequestViewUpdateRequestEvent(
    this.title,
    this.email,
    this.body,
  );

  @override
  List<Object?> get props => [title, email, body];

  @override
  bool get stringify => true;
}

class SupportRequestViewSubmitRequest extends SupportRequestViewEvents {
  // TODO: Create event for submitting a support request
  final SupportRequest supportRequest;

  SupportRequestViewSubmitRequest(this.supportRequest);

  @override
  List<Object?> get props => [supportRequest];

  @override
  bool get stringify => true;
}
