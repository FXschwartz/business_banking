// @dart=2.9

import 'package:business_banking/features/support_request/api/support_request_service.dart';
import 'package:business_banking/features/support_request/api/support_request_service_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('SupportRequestService parseResponse', () async {
    final jsonResponse = {
      "supportRequests": [
        {
          "title": "Dummy Title",
          "body": "Dummy body",
          "email": "dummy@email.com",
        },
      ],
    };

    final supportRequestService = SupportRequestService();
    SupportRequestServiceResponseModel response =
        supportRequestService.parseResponse(jsonResponse);
    print('parseResponse: $response');

    expect(
        response.allSupportRequests[0].title,
        SupportRequestServiceResponseModel.fromJson(jsonResponse)
            .allSupportRequests[0]
            .title);
    expect(
        response.allSupportRequests[0].body,
        SupportRequestServiceResponseModel.fromJson(jsonResponse)
            .allSupportRequests[0]
            .body);
    expect(
        response.allSupportRequests[0].email,
        SupportRequestServiceResponseModel.fromJson(jsonResponse)
            .allSupportRequests[0]
            .email);
  });
}
