// @dart=2.9
import 'package:business_banking/features/support_request/ui/support_request_form/support_request_form_presenter.dart';
import 'package:business_banking/features/support_request/ui/support_request_form/support_request_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SupportRequestFormWidget should be created', (tester) async {
    await tester.pumpWidget(
      MaterialApp(home: SupportRequestFormWidget()),
    );
    await tester.pumpAndSettle();
    expect(find.byType(SupportRequestFormPresenter), findsOneWidget);
  });
}
