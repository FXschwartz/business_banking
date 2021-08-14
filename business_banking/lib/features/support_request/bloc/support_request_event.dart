import 'package:equatable/equatable.dart';

abstract class SupportRequestViewEvents extends Equatable {}

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
