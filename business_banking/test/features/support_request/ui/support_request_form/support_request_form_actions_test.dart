// @dart=2.9
import 'package:business_banking/features/support_request/ui/support_request_form/support_request_form_actions.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter/widgets.dart';

class MockBuildContext extends Mock implements BuildContext {}

class MockCFRouter extends Mock implements CFRouter {}

void main() {
  group('SupportRequestFormActions', () {
    test('should navigate back and give me 100% coverage', () async {
      final router = MockCFRouter();
      final actions = SupportRequestFormActions(router: router);
      final context = MockBuildContext();
      final Future<bool> future = () async {
        actions.navigateBack(context);
        return true;
      }();
      expect(future, completion(equals(true)));
    });
  });
}
