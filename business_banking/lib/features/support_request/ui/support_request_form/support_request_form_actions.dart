import 'package:business_banking/features/support_request/bloc/support_request_bloc.dart';
import 'package:business_banking/features/support_request/bloc/support_request_event.dart';
import 'package:business_banking/features/support_request/model/support_request_view_model.dart';
import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';

class SupportRequestFormActions {
  final SupportRequestBloc bloc;
  final SupportRequestViewModel viewModel;

  SupportRequestFormActions(this.bloc, this.viewModel);

  void navigateBack(BuildContext context) async {
    CFRouterScope.of(context).popUntil(BusinessBankingRouter.hubRoute);
  }

  void updateSupportRequestForm(
      BuildContext context, String title, String email, String body) {
    bloc.supportRequestViewEventsPipe
        .send(SupportRequestViewUpdateRequestEvent(title, email, body));
  }

  // TODO: Replace blow actions in favor of updateSupportRequestForm
  void onUpdateSupportRequestEmail(BuildContext context, String email) {
    bloc.supportRequestViewEventsPipe
        .send(SupportRequestViewUpdateEmailRequestEvent(email));
  }

  void onUpdateSupportRequestTitle(BuildContext context, String title) {
    bloc.supportRequestViewEventsPipe
        .send(SupportRequestViewUpdateTitleRequestEvent(title));
  }

  void onUpdateSupportRequestBody(BuildContext context, String body) {
    bloc.supportRequestViewEventsPipe
        .send(SupportRequestViewUpdateBodyRequestEvent(body));
  }
}
