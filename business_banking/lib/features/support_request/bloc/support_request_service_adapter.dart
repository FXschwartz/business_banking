import 'package:business_banking/features/support_request/api/support_request_service.dart';
import 'package:business_banking/features/support_request/api/support_request_service_response_model.dart';
import 'package:business_banking/features/support_request/model/support_request_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class SupportRequestServiceAdapter extends ServiceAdapter<
    SupportRequestEntity,
    JsonRequestModel,
    SupportRequestServiceResponseModel,
    SupportRequestService> {
  SupportRequestServiceAdapter() : super(SupportRequestService());

  @override
  SupportRequestEntity createEntity(SupportRequestEntity supportRequestEntity,
      SupportRequestServiceResponseModel responseModel) {
    final SupportRequestEntity entity = supportRequestEntity.merge(
        allSupportRequests: responseModel.allSupportRequests);
    return entity;
  }
}
