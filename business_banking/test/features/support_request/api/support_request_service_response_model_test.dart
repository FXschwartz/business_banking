// @dart=2.9

import 'package:business_banking/features/support_request/api/support_request_service_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('SupportRequestServiceResponseModel initialize', () async {
    final jsonResponse = {
      "supportRequests": [
        {
          "title": "Dummy Title",
          "body": "Dummy body",
          "email": "dummy@email.com",
        },
      ],
    };
    final supportRequestViewModel =
        SupportRequestServiceResponseModel.fromJson(jsonResponse);
    expect(supportRequestViewModel.props,
        [supportRequestViewModel.allSupportRequests]);
  });
}
