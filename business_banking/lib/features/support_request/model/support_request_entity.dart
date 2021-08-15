import 'package:business_banking/features/support_request/model/support_request_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class SupportRequestEntity extends Entity {
  final List<SupportRequest>? allSupportRequests;
  SupportRequestEntity({
    List<EntityFailure> errors = const [],
    List<SupportRequest>? allSupportRequests,
  })  : allSupportRequests = allSupportRequests ?? [],
        super(errors: errors);

  @override
  List<Object> get props => [
        errors,
        allSupportRequests!,
      ];

  @override
  SupportRequestEntity merge({
    errors,
    List<SupportRequest>? allSupportRequests,
  }) {
    return SupportRequestEntity(
      errors: errors ?? this.errors,
      allSupportRequests: allSupportRequests ?? this.allSupportRequests,
    );
  }
}
