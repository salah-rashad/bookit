import 'package:bookit/screens/login/authenticate.dart';
import 'package:bookit/services/dialog_service.dart';
import 'package:bookit/services/navigation_service.dart';
import 'package:bookit/ui/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'managers/dialog_manager.dart';
import 'managers/locator.dart';
import 'managers/router.dart';

void main() {
  // Register all the models and services before the app starts
  setupLocator();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Compound',
      builder: (context, child) => Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(child: child)),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      home: StartUpView(),
      onGenerateRoute: generateRoute,
      theme: appTheme,
    );
  }
}
