import 'package:renmoney_test/services/api/api.dart';
import 'package:renmoney_test/services/api/api_service.dart';
import 'package:renmoney_test/services/api/mock_api_service.dart';
import 'package:renmoney_test/services/transactions/transactions.dart';
import 'package:renmoney_test/services/transactions/transactions_service.dart';
import 'package:renmoney_test/ui/views/details/details_view.dart';
import 'package:renmoney_test/ui/views/home_view/home_view.dart';
import 'package:renmoney_test/ui/views/initial%20_view/initial_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

const useMockApiService = false;

@StackedApp(
  routes: [
    AdaptiveRoute(page: InitialView, initial: true),
    AdaptiveRoute(page: HomeView),
    AdaptiveRoute(page: DetailsView),
  ],
  logger: StackedLogger(),
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
    Singleton(
      classType: useMockApiService ? MockApiService : ApiService,
      asType: IApi,
    ),
    LazySingleton(classType: TransactionsService, asType: ITransactions),
  ],
)
class AppSetup {}
