/// Api constants for endpoints and other network related fields
class ApiConstants {
  // Staging API or Production API
  static const _useStagingApi = true;

  static const stagingOrProductionScheme = httpsScheme;

  //static const httpScheme = 'http';
  static const httpsScheme = 'https';

  /// renmoney api constants
  static const renmoneyApiHost = _useStagingApi
      ? 'api-sandbox.renmoney.com'
      : 'api.renmoney.com'; //a guess at the production url
  static const renmoneyApiVersion = '/api/v3';
  static const renmoneydepositTransferEndpoint = '/deposit-transfer';
  static const renmoneyInvestmentEndpoint = '/investment';
  static const renmoneytransactionsEndpoint = '/transactions';

  // Specific Constants
  static const bearerToken =
      'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyMzQ4OTkzOTQ5NjMzIiwiaWF0IjoxNjQ4NjU0OTI1LCJleHAiOjE2NDg3NDEzMjV9.o3VXlAKnHmt_DLv2gQZ9GsLhSsCSIDlOcepGtmG07omgtNXROz8tKY7eyYIv3LH0U0DGBTPLxVS_OAuL_UZ5Nw';
  static const userBVN = 3580016662;

  /// Api request related options
  static const receiveTimeout = 5000;
  static const sendTimeout = 3000;
  static const connectTimeout = 5000;

  /// Renmoney Base Uri
  static get renmoneyBaseUri =>
      Uri(scheme: httpsScheme, host: renmoneyApiHost, path: '/');

  // Endpoints
  static get fetchTransactions => Uri(
      scheme: stagingOrProductionScheme,
      host: renmoneyApiHost,
      path:
          '$renmoneydepositTransferEndpoint$renmoneyApiVersion$renmoneyInvestmentEndpoint/$userBVN$renmoneytransactionsEndpoint/');
}
