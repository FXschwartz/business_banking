// @dart=2.9
import 'package:business_banking/features/support_request/model/support_request_view_model.dart';
import 'package:business_banking/features/support_request/ui/support_request/support_request_actions.dart';
import 'package:business_banking/features/support_request/ui/support_request/support_request_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class SupportRequestActionsMock extends Mock implements SupportRequestActions {}

void main() {
  SupportRequestViewModel viewModel;
  SupportRequestActionsMock actions;
  Widget testWidget;
  final mockObserver = MockNavigatorObserver();

  setUp(() {
    viewModel = SupportRequestViewModel(
      allSupportRequests: [],
    );
    actions = SupportRequestActionsMock();
    testWidget = MaterialApp(
      home: SupportRequestScreen(
        viewModel: viewModel,
        actions: actions,
      ),
      navigatorObservers: [mockObserver],
    );
  });

  tearDown(() {
    viewModel = null;
    actions = null;
    testWidget = null;
  });

  testWidgets('should navigate to SupportRequestFormScreen', (tester) async {
    await tester.pumpWidget(testWidget);
    expect(find.byKey(const Key('supportRequestNavButton')), findsOneWidget);
    await tester.tap(find.byKey(const Key('supportRequestNavButton')));
    await tester.pumpAndSettle();
    verify(mockObserver.didPush(any, any));
  });
}
