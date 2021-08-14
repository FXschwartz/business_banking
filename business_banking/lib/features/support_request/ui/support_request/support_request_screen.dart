import 'package:business_banking/features/support_request/model/support_request_view_model.dart';
import 'package:business_banking/features/support_request/ui/support_request/support_request_actions.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SupportRequestScreen extends Screen {
  final SupportRequestViewModel viewModel;
  final SupportRequestActions actions;

  SupportRequestScreen({required this.viewModel, required this.actions});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          this.actions.navigateToSupportRequestForm(context);
        },
        child: Center(
          child: Text('Support Request'),
        ),
      ),
    );
  }
}
