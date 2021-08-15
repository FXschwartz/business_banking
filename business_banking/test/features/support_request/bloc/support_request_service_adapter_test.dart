// @dart=2.9

import 'dart:convert';

import 'package:business_banking/features/support_request/api/support_request_service_response_model.dart';
import 'package:business_banking/features/support_request/bloc/support_request_service_adapter.dart';
import 'package:business_banking/features/support_request/model/support_request_entity.dart';
import 'package:business_banking/features/support_request/model/support_request_view_model.dart';
import 'package:test/test.dart';

void main() {
  group('SupportRequest service adapter test', () {
    final supportRequestEntity = SupportRequestEntity(allSupportRequests: [
      SupportRequest(
        title: 'Dummy Title',
        body: 'Dummy body',
        email: 'dummy@email.com',
      ),
    ]);
    final jsonResponse = {
      "supportRequests": [
        {
          "title": "Dummy Title",
          "body": "Dummy body",
          "email": "dummy@email.com",
        },
      ]
    };

    test('should take a json response and return a SupportRequest', () async {
      final entity = SupportRequestServiceAdapter().createEntity(
          SupportRequestEntity(),
          SupportRequestServiceResponseModel.fromJson(jsonResponse));
      expect(entity.allSupportRequests[0].title,
          supportRequestEntity.allSupportRequests[0].title);
      expect(entity.allSupportRequests[0].body,
          supportRequestEntity.allSupportRequests[0].body);
      expect(entity.allSupportRequests[0].email,
          supportRequestEntity.allSupportRequests[0].email);
    });
  });
}
