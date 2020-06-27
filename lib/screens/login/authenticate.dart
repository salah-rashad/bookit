import 'package:bookit/ui/apptheme.dart';
import 'package:bookit/viewmodels/startup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider_architecture/provider_architecture.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<StartUpViewModel>.withConsumer(
      viewModelBuilder: () => StartUpViewModel(),
      onModelReady: (model) async {
        await Future.delayed(
            Duration(seconds: 3), () => model.handleStartUpLogic());
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              SpinKitPulse(
                color: awesome,
                duration: Duration(seconds: 2),
                size: 200,
              ),
              Container(
                child: Image.asset(
                  'images/logo2.png',
                  height: 120,
                  width: 120,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*import 'package:flutter/cupertino.dart';

import 'email_register.dart';
import 'login.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView(){
    //print(showSignIn.toString());
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return LoginPage(toggleView:  toggleView);
    } else {
      return EmailRegister(toggleView:  toggleView);
    }
  }
}*/
