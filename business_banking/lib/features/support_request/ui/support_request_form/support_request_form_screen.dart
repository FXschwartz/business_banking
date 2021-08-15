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

  @override
  Widget build(BuildContext context) {
    print('supportRequests: ${viewModel.allSupportRequests}');
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
                  hintText: 'Title',
                  initialValue: '',
                  onChanged: (value) {},
                ),
                SupportRequestInputTextField(
                    formFieldName: 'emailInput',
                    hintText: 'Email Address',
                    keyboardType: TextInputType.emailAddress,
                    initialValue: '',
                    onChanged: (value) {}),
                SupportRequestInputTextField(
                  formFieldName: 'bodyInput',
                  hintText: 'Description',
                  keyboardType: TextInputType.multiline,
                  maxTextLines: 10,
                  initialValue: '',
                  onChanged: (value) {},
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
                            // fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.all(10.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            side: BorderSide(width: 2, color: Colors.green)),
                        onPressed: () {
                          // this.actions.navigateToSupportRequestForm(context);
                          String? email = _supportRequestFormGlobalKey
                              .currentState!.fields['emailInput']!.value;
                          String? title = _supportRequestFormGlobalKey
                              .currentState!.fields['titleInput']!.value;
                          String? body = _supportRequestFormGlobalKey
                              .currentState!.fields['bodyInput']!.value;
                          print('body: $body');
                          actions.updateSupportRequestForm(
                              context, title!, email!, body!);
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
                Container(
                  height:
                      500, // TODO: Change this to just be an array of widgets instead of a listview
                  child: ListView.separated(
                    itemCount: viewModel.allSupportRequests.length,
                    separatorBuilder: (_, index) => Divider(),
                    itemBuilder: (_, index) => Card(
                      key: Key('previousSupportRequest'),
                      color: Colors.white,
                      shadowColor: Colors.grey[500],
                      elevation: 3.0,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 20.0),
                          child: Column(
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(viewModel
                                        .allSupportRequests[index].title)
                                  ]),
                              const Divider(
                                thickness: 2,
                              ),
                              Row(children: [
                                Text(viewModel.allSupportRequests[index].body)
                              ]),
                            ],
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class AllSupportRequests extends StatelessWidget {
//   const AllSupportRequests({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(itemBuilder: (_, index) => viewModel.;
//   }
// }

class SupportRequestInputTextField extends StatelessWidget {
  final String formFieldName;
  final String hintText;
  final TextInputType keyboardType;
  final int maxTextLines;
  final String initialValue;
  final void Function(String?)? onChanged;
  const SupportRequestInputTextField({
    Key? key,
    required this.formFieldName,
    required this.hintText,
    required this.onChanged,
    required this.initialValue,
    this.keyboardType = TextInputType.text,
    this.maxTextLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: FormBuilderTextField(
        initialValue: initialValue,
        maxLines: maxTextLines,
        keyboardType: keyboardType,
        name: formFieldName,
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
        ),
        onChanged: onChanged,
      ),
    );
  }
}
