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

    if (_scopeSupportRequestEntity == null) {
      final newSupportRequestEntity = SupportRequestEntity();
      _scopeSupportRequestEntity = ExampleLocator()
          .repository
          .create<SupportRequestEntity>(
              newSupportRequestEntity, _notifySubscribers);
    } else {
      _scopeSupportRequestEntity!.subscription = _notifySubscribers;
    }

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

  // updateSupportRequestForm(String title, String email, String body) {
  //   SupportRequestEntity supportRequestEntity =
  //       ExampleLocator().repository.get(_scopeSupportRequestEntity!);

  //   ExampleLocator().repository.update(_scopeSupportRequestEntity!,
  //       supportRequestEntity.merge(title: title, email: email, body: body));

  //   _viewModelCallback(buildViewModel(supportRequestEntity));
  // }
}
