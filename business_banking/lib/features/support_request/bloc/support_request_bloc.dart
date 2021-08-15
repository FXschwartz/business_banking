import 'package:business_banking/features/support_request/bloc/support_request_event.dart';
import 'package:business_banking/features/support_request/bloc/support_request_usecase.dart';
import 'package:business_banking/features/support_request/model/support_request_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class SupportRequestBloc extends Bloc {
  SupportRequestUseCase? _supportRequestUseCase;

  final supportRequestViewEventsPipe = Pipe<SupportRequestViewEvents>();
  final supportRequestViewModelPipe = Pipe<SupportRequestViewModel>();

  SupportRequestBloc({
    SupportRequestUseCase? supportRequestUseCase,
  }) {
    // supportRequestViewEventsPipe.receive.listen((event) {
    //   supportRequestViewEventsPipeHandler(event);
    // });

    _supportRequestUseCase = supportRequestUseCase ??
        SupportRequestUseCase((viewModel) => supportRequestViewModelPipe
            .send(viewModel as SupportRequestViewModel));
    supportRequestViewModelPipe.whenListenedDo(_supportRequestUseCase!.create);
  }
  @override
  void dispose() {
    supportRequestViewEventsPipe.dispose();
    supportRequestViewModelPipe.dispose();
  }

  // supportRequestViewEventsPipeHandler(SupportRequestViewEvents event) {
  //   // Figure out what kind of event it is and then handle it accordingly
  //   print('supportRequestViewEventsPipeHandler() event: $event');
  //   if (event is SupportRequestViewSubmitRequest) {}
  // }
}
