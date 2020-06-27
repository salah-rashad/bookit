import 'package:bookit/managers/locator.dart';
import 'package:bookit/services/navigation_service.dart';
import 'package:bookit/ui/route_names.dart';
import 'base_model.dart';

class ProviderModel extends BaseModel {
final NavigationService _navigationService = locator<NavigationService>();

Future navigateToCustomerseView() async {
  await _navigationService.navigateTo(CustomersViewRoute);
}

Future navigateToBook() async {
  await _navigationService.navigateTo(BookRoute);
}
}