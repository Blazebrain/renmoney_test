import 'package:renmoney_test/app/app.locator.dart';
import 'package:renmoney_test/app/app.logger.dart';
import 'package:renmoney_test/model/transaction_response_model.dart';
import 'package:renmoney_test/services/api/api.dart';
import 'package:renmoney_test/services/transactions/transactions.dart';
import 'package:renmoney_test/utils/constants/api_constants.dart';

class TransactionsService implements ITransactions {
  final _apiService = locator<IApi>();
  final log = getLogger('TransactionsService');

  @override
  Future fetchTransactions() async {
    final response = await _apiService.get(
      ApiConstants.fetchTransactions,
      headers: {
        'Authorization': 'Bearer ${ApiConstants.bearerToken}',
        'sourceappid': 'ckpu7zo0p0000gg5436coo7xs',
      },
    );
    return TransactionResponseModel.fromJson(response).data?.clientTransactions;
  }
}
