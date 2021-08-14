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

// TODO: Remove all of these in place of one event editing the entire form
class SupportRequestViewUpdateTitleRequestEvent
    extends SupportRequestViewEvents {
  final String title;

  SupportRequestViewUpdateTitleRequestEvent(this.title);

  @override
  List<Object?> get props => [title];

  @override
  bool get stringify => true;
}

class SupportRequestViewUpdateBodyRequestEvent
    extends SupportRequestViewEvents {
  final String body;

  SupportRequestViewUpdateBodyRequestEvent(this.body);

  @override
  List<Object?> get props => [body];

  @override
  bool get stringify => true;
}

class SupportRequestViewUpdateEmailRequestEvent
    extends SupportRequestViewEvents {
  final String email;

  SupportRequestViewUpdateEmailRequestEvent(this.email);

  @override
  List<Object?> get props => [email];

  @override
  bool get stringify => true;
}
