import 'package:business_banking/features/support_request/bloc/support_request_bloc.dart';
import 'package:business_banking/features/support_request/model/support_request_view_model.dart';
import 'package:business_banking/features/support_request/ui/support_request_form/support_request_form_actions.dart';
import 'package:business_banking/features/support_request/ui/support_request_form/support_request_form_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class SupportRequestFormPresenter extends Presenter<SupportRequestBloc,
    SupportRequestViewModel, SupportRequestFormScreen> {
  @override
  Stream<SupportRequestViewModel> getViewModelStream(SupportRequestBloc bloc) {
    return bloc.supportRequestViewModelPipe.receive;
  }

  @override
  SupportRequestFormScreen buildScreen(BuildContext context,
      SupportRequestBloc bloc, SupportRequestViewModel viewModel) {
    return SupportRequestFormScreen(
      viewModel: viewModel,
      actions: SupportRequestFormActions(bloc, viewModel),
    );
  }
}
