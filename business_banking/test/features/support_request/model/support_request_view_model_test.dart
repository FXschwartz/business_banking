import 'dart:math';

import 'package:business_banking/features/support_request/model/support_request_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Support Request View Model', () {
    final supportRequestViewModel =
        SupportRequestViewModel(allSupportRequests: [
      SupportRequest(
        title: 'Dummy Title',
        body: 'Dummy body',
        email: 'dummy@email.com',
      ),
    ]);

    test('should properties match', () async {
      var supportRequest = supportRequestViewModel.allSupportRequests[0];
      expect(supportRequest.title, 'Dummy Title');
      expect(supportRequest.body, 'Dummy body');
      expect(supportRequest.email, 'dummy@email.com');

      var supportRequestFromJson = SupportRequest.fromJson({
        "title": "Test Title",
        "body": "Test body",
        "email": "test@email.com"
      });
      expect(supportRequestFromJson.title, 'Test Title');
      expect(supportRequestFromJson.body, 'Test body');
      expect(supportRequestFromJson.email, 'test@email.com');
    });

    test('should be two support requests', () async {
      expect(supportRequestViewModel.allSupportRequests.length, 1);
      supportRequestViewModel.allSupportRequests.add(SupportRequest(
        title: 'Dummy Title 2',
        body: 'Dummy body 2',
        email: 'dummy2@email.com',
      ));
      expect(supportRequestViewModel.allSupportRequests.length, 2);
    });

    test('should props match', () async {
      expect(supportRequestViewModel.props,
          [supportRequestViewModel.allSupportRequests]);
    });
  });
}
