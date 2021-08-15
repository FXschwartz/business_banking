// @dart=2.9

import 'package:business_banking/features/support_request/bloc/support_request_bloc.dart';
import 'package:business_banking/features/support_request/bloc/support_request_event.dart';
import 'package:business_banking/features/support_request/model/support_request_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:mockito/mockito.dart';

class SupportRequestBlocMock extends Mock implements SupportRequestBloc {
  @override
  final supportRequestViewEventsPipe = Pipe<SupportRequestViewEvents>();
  @override
  final supportRequestViewModelPipe = Pipe<SupportRequestViewModel>();

  SupportRequestViewModel supportRequestViewModelSample =
      SupportRequestViewModel(allSupportRequests: [
    SupportRequest(
        title: 'Dummy Title', body: 'Dummy body', email: 'dummy@email.com'),
  ]);

  SupportRequestBlocMock() {
    supportRequestViewModelPipe.whenListenedDo(() {
      supportRequestViewModelPipe.send(supportRequestViewModelSample);
    });
  }
}
