import 'package:business_banking/features/support_request/bloc/support_request_bloc.dart';
import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';

class SupportRequestActions {
  final SupportRequestBloc bloc;

  SupportRequestActions(this.bloc);

  void navigateToSupportRequestForm(BuildContext context) {
    CFRouterScope.of(context)
        .push(BusinessBankingRouter.supportRequestFormRoute);
  }
}
