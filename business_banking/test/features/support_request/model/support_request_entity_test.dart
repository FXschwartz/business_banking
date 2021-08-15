// @dart=2.9
import 'dart:math';

import 'package:business_banking/features/support_request/model/support_request_entity.dart';
import 'package:business_banking/features/support_request/model/support_request_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SupportRequestEntity', () {
    final supportRequestEntity = SupportRequestEntity(allSupportRequests: [
      SupportRequest(
        title: 'Dummy Title',
        body: 'Dummy body',
        email: 'dummy@email.com',
      ),
    ]);

    test('should properties match', () async {
      var supportRequest = supportRequestEntity.allSupportRequests[0];
      expect(supportRequest.title, 'Dummy Title');
      expect(supportRequest.body, 'Dummy body');
      expect(supportRequest.email, 'dummy@email.com');
    });

    test('should merge function return new Entity', () async {
      SupportRequestEntity newSupportRequest =
          supportRequestEntity.merge(allSupportRequests: [
        SupportRequest(
          title: 'Dummy Title 2',
          body: 'Dummy body 2',
          email: 'dummy2@email.com',
        ),
      ]);
      expect(newSupportRequest.allSupportRequests[0].title, 'Dummy Title 2');
      expect(newSupportRequest.allSupportRequests[0].body, 'Dummy body 2');
      expect(newSupportRequest.allSupportRequests[0].email, 'dummy2@email.com');
    });

    test('should props match', () async {
      expect(supportRequestEntity.props,
          [[], supportRequestEntity.allSupportRequests]);
    });
  });
}
