import 'package:bookit/managers/locator.dart';
import 'package:bookit/services/authentication_service.dart';
import 'package:bookit/services/navigation_service.dart';
import 'package:bookit/ui/route_names.dart';
import 'base_model.dart';

class StartUpViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future handleStartUpLogic() async {
    var hasLoggedInUser = await _authenticationService.isUserLoggedIn();

    if (hasLoggedInUser) {
      _navigationService.navigateTo(HomeViewRoute, replacement: true);
    } else {
      _navigationService.navigateTo(LoginViewRoute, replacement: true);
    }
  }
}
