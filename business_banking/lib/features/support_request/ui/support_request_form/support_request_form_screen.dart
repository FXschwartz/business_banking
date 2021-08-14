import 'package:auto_size_text/auto_size_text.dart';
import 'package:business_banking/features/support_request/model/support_request_view_model.dart';
import 'package:business_banking/features/support_request/ui/support_request_form/support_request_form_actions.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SupportRequestFormScreen extends Screen {
  final SupportRequestViewModel viewModel;
  final SupportRequestFormActions actions;

  SupportRequestFormScreen({required this.viewModel, required this.actions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: GestureDetector(
          child: Icon(
            Icons.chevron_left,
            size: 40.0,
          ),
          onTap: () {
            this.actions.navigateBack(context);
          },
          key: Key('backButton'),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              'Submit Support Request',
              key: Key('supportRequestFormTitle'),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(5.0),
        child: Center(
          child: Text('Support Request Form Screen'),
        ),
      ),
    );
  }
}
