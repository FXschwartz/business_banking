import 'package:clean_framework/clean_framework.dart';

class SupportRequestEntity extends Entity {
  final String title;
  final String body;
  final String email;

  SupportRequestEntity({
    // TODO: Figure out if I need this errors field
    List<EntityFailure> errors = const [],
    String? title,
    String? body,
    String? email,
  })  : title = title ?? '',
        body = body ?? '',
        email = email ?? '',
        super(errors: errors);

  @override
  List<Object> get props => [
        errors,
        title,
        body,
        email,
      ];

  @override
  merge({
    errors,
    String? title,
    String? body,
    String? email,
  }) {
    return SupportRequestEntity(
      errors: errors ?? this.errors,
      title: title ?? this.title,
      email: email ?? this.email,
      body: body ?? this.body,
    );
  }
}
