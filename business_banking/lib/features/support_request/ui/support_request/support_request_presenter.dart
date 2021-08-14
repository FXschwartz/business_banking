import 'package:business_banking/features/support_request/bloc/support_request_bloc.dart';
import 'package:business_banking/features/support_request/bloc/support_request_event.dart';
import 'package:business_banking/features/support_request/model/support_request_view_model.dart';
import 'package:business_banking/features/support_request/ui/support_request/support_request_actions.dart';
import 'package:business_banking/features/support_request/ui/support_request/support_request_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class SupportRequestPresenter extends Presenter<SupportRequestBloc,
    SupportRequestViewModel, SupportRequestScreen> {
  @override
  Stream<SupportRequestViewModel> getViewModelStream(SupportRequestBloc bloc) {
    return bloc.supportRequestViewModelPipe.receive;
  }

  @override
  SupportRequestScreen buildScreen(BuildContext context,
      SupportRequestBloc bloc, SupportRequestViewModel viewModel) {
    return SupportRequestScreen(
      viewModel: viewModel,
      actions: SupportRequestActions(bloc),
    );
  }
}
