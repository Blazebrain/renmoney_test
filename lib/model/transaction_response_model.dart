import 'transaction_model.dart';

class TransactionResponseModel {
  String? status;
  String? code;
  String? message;
  TransactionModel? data;

  TransactionResponseModel({this.status, this.code, this.message, this.data});

  TransactionResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    data =
        json['data'] != null ? TransactionModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['code'] = code;
    data['message'] = message;
    data['data'] = this.data!.toJson();
    return data;
  }
}
