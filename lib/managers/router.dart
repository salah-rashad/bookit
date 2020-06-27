import 'package:bookit/screens/home/book.dart';
import 'package:bookit/screens/home/customerList.dart';
import 'package:bookit/screens/home/home_page.dart';
import 'package:bookit/screens/home/profile.dart';
import 'package:bookit/screens/home/provider_screen.dart';
import 'package:bookit/screens/home/settings.dart';
import 'package:bookit/screens/login/email_register.dart';
import 'package:bookit/screens/login/login.dart';
import 'package:bookit/ui/route_names.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LoginPage(),
      );
    case SignUpViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: EmailRegister(),
      );
    case HomeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomePage(),
      );
    case CustomersViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: Customers(),
      );
    case ProviderScreenRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: ProviderScreen(),
      );
    case BookRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: Book(),
      );
    case ProfileRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: Profile(),
      );
    case SettingsViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: Settings(),
      );

    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
