import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';

class SupportRequestFormActions {
  // Parameter is for testing only
  final CFRouter? _router;

  SupportRequestFormActions({CFRouter? router}) : _router = router;

  void navigateBack(BuildContext context) async {
    final router = _router ?? CFRouterScope.of(context);
    router.popUntil(BusinessBankingRouter.hubRoute);
  }
}
