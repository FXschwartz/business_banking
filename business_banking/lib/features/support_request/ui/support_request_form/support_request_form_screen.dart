import 'package:business_banking/features/support_request/model/support_request_view_model.dart';
import 'package:business_banking/features/support_request/ui/support_request_form/support_request_form_actions.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';

class SupportRequestFormScreen extends Screen {
  final SupportRequestViewModel viewModel;
  final SupportRequestFormActions actions;

  SupportRequestFormScreen({required this.viewModel, required this.actions});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Center(
        child: Text('Support Request Form Screen'),
      ),
    );
  }
}
