import 'package:business_banking/features/support_request/bloc/support_request_service_adapter.dart';
import 'package:business_banking/features/support_request/model/support_request_entity.dart';
import 'package:business_banking/features/support_request/model/support_request_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class SupportRequestUseCase extends UseCase {
  late final ViewModelCallback<ViewModel> _viewModelCallback;
  SupportRequestUseCase(ViewModelCallback<ViewModel> viewModelCallback)
      : _viewModelCallback = viewModelCallback;

  Future<void> create() async {
    final scope = ExampleLocator().repository.create<SupportRequestEntity>(
        SupportRequestEntity(), _notifySubscribers);

    return ExampleLocator()
        .repository
        .runServiceAdapter(scope, SupportRequestServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallback(buildViewModel(entity));
  }

  SupportRequestViewModel buildViewModel(
      SupportRequestEntity supportRequestEntityModel) {
    return SupportRequestViewModel(
      title: supportRequestEntityModel.title,
      body: supportRequestEntityModel.body,
      email: supportRequestEntityModel.email,
    );
  }
}
