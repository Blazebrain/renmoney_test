import 'client_transactions_model.dart';

class TransactionModel {
  List<ClientTransactions>? clientTransactions;

  TransactionModel({this.clientTransactions});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    if (json['clientTransactions'] != null) {
      clientTransactions = <ClientTransactions>[];
      json['clientTransactions'].forEach((v) {
        clientTransactions!.add(ClientTransactions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['clientTransactions'] =
        clientTransactions!.map((v) => v.toJson()).toList();
    return data;
  }
}
