import 'package:business_banking/features/support_request/api/support_request_service_response_model.dart';
import 'package:business_banking/features/support_request/bloc/support_request_service_adapter.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class SupportRequestService extends EitherService<JsonRequestModel,
    SupportRequestServiceResponseModel> {
  SupportRequestService()
      : super(
          method: RestMethod.get,
          restApi: ExampleLocator().api,
          path: 'support-request',
        );

  @override
  SupportRequestServiceResponseModel parseResponse(
      Map<String, dynamic> jsonResponse) {
    return SupportRequestServiceResponseModel.fromJson(jsonResponse);
  }
}
