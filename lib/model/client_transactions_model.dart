class ClientTransactions {
  int? transactionId;
  String? type;
  double? amount;
  String? comment;
  String? entryDate;
  String? currencyCode;
  String? balance;

  ClientTransactions(
      {this.transactionId,
      this.type,
      this.amount,
      this.comment,
      this.entryDate,
      this.currencyCode,
      this.balance});

  ClientTransactions.fromJson(Map<String, dynamic> json) {
    transactionId = json['transactionId'];
    type = json['type'];
    amount = json['amount'];
    comment = json['comment'];
    entryDate = json['entryDate'];
    currencyCode = json['currencyCode'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['transactionId'] = transactionId;
    data['type'] = type;
    data['amount'] = amount;
    data['comment'] = comment;
    data['entryDate'] = entryDate;
    data['currencyCode'] = currencyCode;
    data['balance'] = balance;
    return data;
  }
}
