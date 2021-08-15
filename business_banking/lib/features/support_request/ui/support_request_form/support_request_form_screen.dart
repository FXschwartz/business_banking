import 'package:auto_size_text/auto_size_text.dart';
import 'package:business_banking/features/support_request/model/support_request_view_model.dart';
import 'package:business_banking/features/support_request/ui/support_request_form/support_request_form_actions.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class SupportRequestFormScreen extends Screen {
  final SupportRequestViewModel viewModel;
  final SupportRequestFormActions actions;

  SupportRequestFormScreen({required this.viewModel, required this.actions});
  final _supportRequestFormGlobalKey = GlobalKey<FormBuilderState>();

  List<Widget> createAllSupportRequestWidgets() {
    return viewModel.allSupportRequests.map<Widget>((supportRequest) {
      return Card(
        key: ValueKey(supportRequest.email),
        color: Colors.white,
        shadowColor: Colors.grey[500],
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text(supportRequest.title)]),
              const Divider(
                thickness: 2,
              ),
              Row(children: [
                Expanded(child: Text(supportRequest.body)),
              ]),
            ],
          ),
        ),
      );
    }).toList();
  }

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
      body: FormBuilder(
        key: _supportRequestFormGlobalKey,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                    'Submit a support request with a title, the email address you would like to support to contact you, and then a brief description of what you would like help with.'),
                SupportRequestInputTextField(
                  formFieldName: 'titleInput',
                  key: Key('titleInput'),
                  hintText: 'Title',
                  onChanged: (value) {},
                  formValidations: [
                    FormBuilderValidators.required(context,
                        errorText:
                            'Please enter a short title summarizing the problem'),
                  ],
                ),
                SupportRequestInputTextField(
                  formFieldName: 'emailInput',
                  key: Key('emailInput'),
                  hintText: 'Email Address',
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {},
                  formValidations: [
                    FormBuilderValidators.required(context,
                        errorText:
                            'Please enter the email address you\'d like to be contacted at'),
                    FormBuilderValidators.email(context,
                        errorText: 'Please enter a valid email address'),
                  ],
                ),
                SupportRequestInputTextField(
                  formFieldName: 'bodyInput',
                  key: Key('bodyInput'),
                  hintText: 'Description',
                  keyboardType: TextInputType.multiline,
                  maxTextLines: 10,
                  onChanged: (value) {},
                  formValidations: [
                    FormBuilderValidators.required(context,
                        errorText: 'Please enter a description of the problem'),
                    FormBuilderValidators.minLength(context, 20,
                        errorText:
                            'Description must be longer than 20 characters long')
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        key: Key('supportRequestFormSubmitButton'),
                        child: Text(
                          'Submit Request',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.all(10.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            side: BorderSide(width: 2, color: Colors.green)),
                        onPressed: () {
                          _supportRequestFormGlobalKey.currentState!.validate();
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                      'Here are some previously submitted support requests'),
                ),
                Column(
                  children: createAllSupportRequestWidgets(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SupportRequestInputTextField extends StatelessWidget {
  final String formFieldName;
  final String hintText;
  final TextInputType keyboardType;
  final int maxTextLines;
  final void Function(String?)? onChanged;
  final List<String? Function(String?)> formValidations;
  const SupportRequestInputTextField({
    Key? key,
    required this.formFieldName,
    required this.hintText,
    required this.onChanged,
    this.keyboardType = TextInputType.text,
    this.maxTextLines = 1,
    required this.formValidations,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: FormBuilderTextField(
        maxLines: maxTextLines,
        keyboardType: keyboardType,
        name: formFieldName,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(
                10.0,
              ),
            ),
          ),
          filled: true,
          hintStyle: TextStyle(color: Colors.grey[800]),
          hintText: hintText,
          fillColor: Colors.white70,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ),
        onChanged: onChanged,
        validator: FormBuilderValidators.compose(formValidations),
      ),
    );
  }
}
