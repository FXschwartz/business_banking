import 'package:business_banking/features/support_request/model/support_request_view_model.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class SupportRequestServiceResponseModel extends JsonResponseModel {
  final List<SupportRequest> allSupportRequests;

  SupportRequestServiceResponseModel.fromJson(Map<String, dynamic> json)
      : allSupportRequests = (json['supportRequests'] as List)
            .map((request) => new SupportRequest.fromJson(request))
            .toList();

  @override
  List<Object> get props => [allSupportRequests];
}
