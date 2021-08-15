import 'package:business_banking/features/support_request/bloc/support_request_service_adapter.dart';
import 'package:business_banking/features/support_request/model/support_request_entity.dart';
import 'package:business_banking/features/support_request/model/support_request_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:flutter/cupertino.dart';

class SupportRequestUseCase extends UseCase {
  late final ViewModelCallback<ViewModel> _viewModelCallback;
  RepositoryScope? _scopeSupportRequestEntity;

  SupportRequestUseCase(ViewModelCallback<ViewModel> viewModelCallback)
      : _viewModelCallback = viewModelCallback;

  Future<void> create() async {
    _scopeSupportRequestEntity = ExampleLocator()
        .repository
        .create<SupportRequestEntity>(
            SupportRequestEntity(), _notifySubscribers);

    await ExampleLocator().repository.runServiceAdapter(
        _scopeSupportRequestEntity!, SupportRequestServiceAdapter());
  }

  void _notifySubscribers(entity) {
    buildViewModel(entity);
  }

  buildViewModel(SupportRequestEntity supportRequestEntity) {
    _viewModelCallback(SupportRequestViewModel(
        allSupportRequests: supportRequestEntity.allSupportRequests!));
  }
}
