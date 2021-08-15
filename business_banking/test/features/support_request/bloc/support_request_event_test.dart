// @dart=2.9

import 'package:business_banking/features/support_request/bloc/support_request_event.dart';
import 'package:test/test.dart';

void main() {
  group('SupportRequest Event', () {
    test('should props match and stringify be true', () async {
      final requestEvent = SupportRequestViewUpdateRequestEvent(
        'Dummy Title',
        'Dummy body',
        'dummy@email.com',
      );
      expect(requestEvent.props, [
        'Dummy Title',
        'Dummy body',
        'dummy@email.com',
      ]);
      expect(requestEvent.stringify, true);
    });
  });
}
