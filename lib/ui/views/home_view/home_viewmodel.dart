import 'package:flutter/material.dart';
import 'package:renmoney_test/app/app.router.dart';
import 'package:renmoney_test/utils/constants/app_assets.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../model/client_transactions_model.dart';
import '../../../services/transactions/transactions.dart';

class HomeViewModel extends BaseViewModel {
  final _transactionsService = locator<ITransactions>();
  final _navigationService = locator<NavigationService>();

  List<ClientTransactions>? clientTransactions = [];

  Future fetchUserTransactions() async {
    clientTransactions = await _transactionsService.fetchTransactions();
    notifyListeners();
  }

  SvgData getTileIcon(String? transactionType) {
    switch (transactionType) {
      case "DEPOSIT":
        return SvgAssets.depositIcon;
      case "TRANSFER":
        return SvgAssets.transferIcon;
      case "WITHDRAWAL":
        return SvgAssets.airtimeIcon;
      default:
        return SvgAssets.airtimeIcon;
    }
  }

  Color getIconColor(String? transactionType) {
    switch (transactionType) {
      case "DEPOSIT":
        return const Color.fromRGBO(101, 173, 196, 0.1);
      case "TRANSFER":
        return const Color.fromRGBO(119, 101, 196, 0.1);
      case "WITHDRAWAL":
        return const Color.fromRGBO(228, 118, 115, 0.1);
      default:
        return const Color.fromRGBO(228, 118, 115, 0.1);
    }
  }

  void goToDetailsView(ClientTransactions model) {
    _navigationService.navigateTo(Routes.detailsView,
        arguments: DetailsViewArguments(model: model));
  }
}
