import 'package:flutter/material.dart';
import 'package:bookit/home_Page.dart';
import 'package:bookit/screens/home/Profile.dart';
import 'package:bookit/screens/home/provider_screen.dart';
import 'package:bookit/screens/login/login.dart';
import 'package:bookit/screens/login/register.dart';
import 'package:bookit/screens/login/email_register.dart';
import 'package:bookit/screens/login/forgot_password.dart';
import 'package:bookit/screens/login/confirmation.dart';
import 'package:bookit/screens/login/new_password.dart';
import 'package:bookit/screens/home/settings.dart';


void main(){
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      routes: <String , WidgetBuilder>{
        '/LoginPage' : (BuildContext context) =>new LoginPage(),
        '/Register' : (BuildContext context) =>new Register(),
        '/EmailRegister' : (BuildContext context) =>new EmailRegister(),
        '/ForgotPassword' : (BuildContext context) =>new ForgotPassword(),
        '/Confirmation' : (BuildContext context) =>new Confirmation(),
        '/NewPassword' : (BuildContext context) =>new NewPassword(),
        '/ProviderScreen' : (BuildContext context) =>new ProviderScreen(),
        '/HomePage' : (BuildContext context) =>new HomePage(),
        '/Profile' : (BuildContext context) =>new Profile(),
        '/Settings' : (BuildContext context) =>new Settings(),



      },
      home: new LoginPage(),
    );
  }
}

