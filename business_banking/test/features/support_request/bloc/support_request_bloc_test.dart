// @dart=2.9

import 'package:business_banking/features/support_request/bloc/support_request_bloc.dart';
import 'package:business_banking/features/support_request/bloc/support_request_usecase.dart';
import 'package:business_banking/features/support_request/model/support_request_view_model.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockSupportRequestUseCase extends Mock implements SupportRequestUseCase {}

void main() {
  SupportRequestBloc bloc;
  MockSupportRequestUseCase mockSupportRequestUseCase;

  setUp(() {
    mockSupportRequestUseCase = MockSupportRequestUseCase();
    bloc = SupportRequestBloc(
      supportRequestUseCase: mockSupportRequestUseCase,
    );
  });

  tearDown(() {
    bloc.dispose();
    expect(bloc.supportRequestViewModelPipe.receive, emitsDone);
    expect(bloc.supportRequestViewEventsPipe.receive, emitsDone);
  });

  group('SupportRequest Bloc', () {
    SupportRequest supportRequest = SupportRequest(
      title: 'Dummy Title',
      body: 'Dummy body',
      email: 'dummy@email.com',
    );
    SupportRequestViewModel supportRequestViewModel =
        SupportRequestViewModel(allSupportRequests: [supportRequest]);

    test('should supportRequestViewModelPipe gets view model', () async {
      bloc.supportRequestViewModelPipe.send(supportRequestViewModel);
      bloc.supportRequestViewModelPipe.receive.listen((event) {
        verify(mockSupportRequestUseCase.create()).called(1);
      });
    });
  });
}
