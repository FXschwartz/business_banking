import 'package:business_banking/features/support_request/bloc/support_request_bloc.dart';
import 'package:business_banking/features/support_request/ui/support_request/support_request_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SupportRequestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SupportRequestBloc>(
      create: (BuildContext context) => SupportRequestBloc(),
      child: SupportRequestPresenter(),
    );
  }
}
