import 'package:renmoney_test/app/app.locator.dart';
import 'package:renmoney_test/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class InitialViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void goToHomeView() {
    _navigationService.navigateTo(Routes.homeView);
  }
}
