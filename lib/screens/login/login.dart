import 'package:bookit/ui/apptheme.dart';
import 'package:bookit/viewmodels/login_view_model.dart';
import 'package:bookit/widgets/circular_button.dart';
import 'package:bookit/widgets/custom_button.dart';
import 'package:bookit/widgets/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class LoginPage extends StatelessWidget {
  // final Function toggleView;
  // LoginPage({this.toggleView});

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  // final GoogleSignIn _googlSignIn = new GoogleSignIn();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<LoginViewModel>.withConsumer(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, model, child) {
          return Scaffold(
              resizeToAvoidBottomInset: false,
              body: Container(
                padding: EdgeInsets.only(right: 32, left: 32),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Stack(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.center,
                              child: ClipRRect(
                                child: Image.asset(
                                  'images/logo2.png',
                                  fit: BoxFit.fill,
                                  height: 150,
                                  width: 150,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                'تسجيل الدخول',
                                style: AppTextStyle(color: darkBlue, size: 22.0)
                                    .bold(),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              CustomTextFormField(
                                directionality: TextDirection.ltr,
                                controller: emailController,
                                hintText: 'الايميل',
                                bgColor: offWhite,
                                textInputType: TextInputType.emailAddress,
                                secure: false,
                                shadowColor: darkBlue,
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 12)),
                              CustomTextFormField(
                                directionality: TextDirection.ltr,
                                controller: passwordController,
                                hintText: 'كلمة المرور',
                                bgColor: offWhite,
                                textInputType: TextInputType.visiblePassword,
                                secure: true,
                                shadowColor: darkBlue,
                                validator: (val) =>
                                    val.isEmpty ? 'Enter an email' : null,
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 12)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      CircularButton(
                                        onTap: () {
                                          Navigator.of(context)
                                              .pushNamed('/HomePage');
                                        },
                                        shadowColor: grey1,
                                        bgColor: white,
                                        image: Image.asset(
                                          'images/f_white.png',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      CircularButton(
                                        onTap: () {
                                          Navigator.of(context)
                                              .pushNamed('/HomePage');
                                        },
                                        shadowColor: darkBlue,
                                        bgColor: white,
                                        image: Image.asset(
                                          'images/google.png',
                                          fit: BoxFit.scaleDown,
                                          scale: 1.5,
                                          height: 30,
                                          width: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                  FlatButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed('/ForgotPassword');
                                    },
                                    child: Text(
                                      'نسيت كلمة المرور ؟',
                                      style: AppTextStyle(
                                        color: lightBlue,
                                        size: 14.0,
                                      ).bold().apply(
                                          decoration: TextDecoration.underline),
                                    ),
                                    color: Colors.transparent,
                                  ),
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 12))
                            ],
                          )),
                      Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.only(bottom: 32),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                CustomButton(
                                  onTap: () {
                                    model.login(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  },
                                  name: 'الدخول',
                                  bgColor: awesome,
                                  shadowColor: awesome,
                                ),
                                CustomButton(
                                  name: 'انشاء حساب جديد',
                                  onTap: () {
                                    model.navigateToSignUp();
                                  },
                                  isBorderd: true,
                                  textColor: lightBlue,
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ));
        });
  }
}
