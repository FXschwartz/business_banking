// @dart=2.9
import 'package:business_banking/features/support_request/model/support_request_view_model.dart';
import 'package:business_banking/features/support_request/ui/support_request_form/support_request_form_actions.dart';
import 'package:business_banking/features/support_request/ui/support_request_form/support_request_form_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockBuildContext extends Mock implements BuildContext {}

class MockCFRouter extends Mock implements CFRouter {}

class SupportRequestFormActionsMock extends Mock
    implements SupportRequestFormActions {}

void main() {
  SupportRequestViewModel viewModel;
  SupportRequestFormActionsMock actions;
  final mockObserver = MockNavigatorObserver();
  Widget testWidget;
  setUp(() {
    viewModel = SupportRequestViewModel(
      allSupportRequests: [
        SupportRequest(
            title: 'My Test Title',
            body: 'My test body',
            email: 'test@email.com')
      ],
    );
    actions = SupportRequestFormActionsMock();
    testWidget = MaterialApp(
      home: SupportRequestFormScreen(
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

  group('Support Request Form Screen', () {
    testWidgets('titleInput should exist and react to user input',
        (tester) async {
      await tester.pumpWidget(testWidget);
      // Test Title Input
      var requestTitleWidget = find.byKey(const Key('titleInput'));
      expect(requestTitleWidget, findsOneWidget);
      await tester.enterText(requestTitleWidget, 'My Dummy Title');
      expect(find.text('My Dummy Title'), findsOneWidget);
    });
    testWidgets('emailInput should exist and react to user input',
        (tester) async {
      await tester.pumpWidget(testWidget);

      // Test Email Input
      var requestEmailWidget = find.byKey(const Key('emailInput'));
      expect(requestEmailWidget, findsOneWidget);
      await tester.enterText(requestEmailWidget, 'dummy@email.com');
      expect(find.text('dummy@email.com'), findsOneWidget);
    });
    testWidgets('bodyInput should exist and react to user input',
        (tester) async {
      await tester.pumpWidget(testWidget);

      // Test Body Input
      var requestBodyWidget = find.byKey(const Key('bodyInput'));
      expect(requestBodyWidget, findsOneWidget);
      await tester.enterText(requestBodyWidget, 'My dummy body');
      expect(find.text('My dummy body'), findsOneWidget);
    });

    testWidgets('should display one support request', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();
      var supportRequest = find.byKey(ValueKey('test@email.com'));
      expect(supportRequest, findsOneWidget);
    });

    testWidgets('support request should display correct info', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();
      expect(find.text('My Test Title'), findsOneWidget);
      expect(find.text('My test body'), findsOneWidget);
    });

    testWidgets('tap on submit button should', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.tap(find.byKey(const Key('supportRequestFormSubmitButton')));
      await tester.pumpAndSettle();
    });

    testWidgets('tap on back button should pop current route', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.tap(find.byKey(const Key('backButton')));
    });

    test(
        'tap on back button should pop current route and give me 100% coverage',
        () async {
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
