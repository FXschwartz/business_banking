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
    _viewModelCallback(buildViewModel(entity));
  }

  SupportRequestViewModel buildViewModel(
      SupportRequestEntity supportRequestEntity) {
    print('buildViewModel email: ${supportRequestEntity.email}');
    return SupportRequestViewModel(
      title: supportRequestEntity.title,
      body: supportRequestEntity.body,
      email: supportRequestEntity.email,
    );
  }

  updateSupportRequestForm(String title, String email, String body) {
    SupportRequestEntity supportRequestEntity =
        ExampleLocator().repository.get(_scopeSupportRequestEntity!);

    ExampleLocator().repository.update(_scopeSupportRequestEntity!,
        supportRequestEntity.merge(title: title, email: email, body: body));

    _viewModelCallback(buildViewModel(supportRequestEntity));
  }

  // TODO: Remove these in place of the updateSupportRequestForm method
  updateSupportRequestEmail(String email) {
    SupportRequestEntity supportRequestEntity =
        ExampleLocator().repository.get(_scopeSupportRequestEntity!);
    ExampleLocator().repository.update(
        _scopeSupportRequestEntity!, supportRequestEntity.merge(email: email));
    _viewModelCallback(buildViewModel(supportRequestEntity));
  }

  updateSupportRequestTitle(String title) {
    SupportRequestEntity supportRequestEntity =
        ExampleLocator().repository.get(_scopeSupportRequestEntity!);
    ExampleLocator().repository.update(
        _scopeSupportRequestEntity!, supportRequestEntity.merge(title: title));
    _viewModelCallback(buildViewModel(supportRequestEntity));
  }

  updateSupportRequestBody(String body) {
    SupportRequestEntity supportRequestEntity =
        ExampleLocator().repository.get(_scopeSupportRequestEntity!);
    ExampleLocator().repository.update(
        _scopeSupportRequestEntity!, supportRequestEntity.merge(body: body));
    _viewModelCallback(buildViewModel(supportRequestEntity));
  }
}
