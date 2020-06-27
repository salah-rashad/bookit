import 'package:flutter/material.dart';

class NavigationService {
  GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  bool pop() {
    return _navigationKey.currentState.pop();
  }

  Future<dynamic> navigateTo(
    String routeName, {
    dynamic arguments,
    bool replacement = false,
    bool fullReplacementUntil = false,
  }) {
    if (replacement)
      return _navigationKey.currentState
          .pushReplacementNamed(routeName, arguments: arguments);
    else if (fullReplacementUntil != null)
      return _navigationKey.currentState.pushNamedAndRemoveUntil(
        routeName,
        (Route<dynamic> route) => false,
        arguments: arguments,
      );
    else
      return _navigationKey.currentState
          .pushNamed(routeName, arguments: arguments);
  }
}
