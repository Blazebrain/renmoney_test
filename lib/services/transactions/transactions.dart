import 'package:flutter/material.dart';

abstract class ITransactions {
  /// [Future]<[dynamic]> fetch list of user's transactions
  ///
  /// API Method: GET
  /// headers: String [token], String [sourceappid]
  ///
  /// parameters:
  Future fetchTransactions();
}
