import 'package:bookit/screens/login/authenticate.dart';
import 'package:bookit/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:bookit/home_Page.dart';
import 'package:provider/provider.dart';

import 'models/uesr.dart';


void main(){
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);

    // return either the Home or Authenticate widget
    if (user == null){
      return Authenticate();
    } else {
      return HomePage();
    }

  }
}