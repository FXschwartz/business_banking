import 'package:business_banking/features/support_request/bloc/support_request_bloc.dart';
import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';

class SupportRequestActions {
  // Parameter is for testing only
  final CFRouter? _router;

  SupportRequestActions({CFRouter? router}) : _router = router;

  void navigateToSupportRequestForm(BuildContext context) {
    final router = _router ?? CFRouterScope.of(context);
    router.push(BusinessBankingRouter.supportRequestFormRoute);
  }
}
