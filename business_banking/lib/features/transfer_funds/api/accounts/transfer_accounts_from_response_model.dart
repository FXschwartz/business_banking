import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class TransferFundsAccountsFromResponseModel extends Equatable implements JsonResponseModel {
  final List<String> fromAccounts;

  TransferFundsAccountsFromResponseModel.fromJson(Map<String, dynamic> json)
      :
        fromAccounts = List.from(json['fromAccounts']) ?? null;

  @override
  List<Object> get props => [fromAccounts];
}