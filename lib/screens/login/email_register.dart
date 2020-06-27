import 'package:bookit/viewmodels/signup_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookit/widgets/custom_button.dart';
import 'package:bookit/widgets/custom_textfield.dart';
import 'package:bookit/ui/apptheme.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class EmailRegister extends StatelessWidget {
  final Function toggleView;
  EmailRegister({this.toggleView});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String name = '';

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SignUpViewModel>.withConsumer(
        viewModelBuilder: () => SignUpViewModel(),
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
                                'انشاء حساب جديد',
                                style: AppTextStyle(color: darkBlue, size: 22.0)
                                    .bold(),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CustomTextFormField(
                                hintText: 'الاسم',
                                controller: fullNameController,
                                directionality: TextDirection.rtl,
                                secure: false,
                                shadowColor: darkBlue,
                                bgColor: offWhite,
                                validator: (val) =>
                                    val.isEmpty ? 'Enter an email' : null,
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 12)),
                              CustomTextFormField(
                                hintText: 'الايميل',
                                controller: emailController,
                                directionality: TextDirection.rtl,
                                secure: false,
                                shadowColor: darkBlue,
                                textInputType: TextInputType.emailAddress,
                                bgColor: offWhite,
                                validator: (val) =>
                                    val.isEmpty ? 'Enter an email' : null,
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 12)),
                              CustomTextFormField(
                                hintText: 'كلمة المرور',
                                controller: passwordController,
                                directionality: TextDirection.rtl,
                                secure: true,
                                shadowColor: darkBlue,
                                bgColor: offWhite,
                                validator: (val) =>
                                    val.isEmpty ? 'Enter an email' : null,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.only(bottom: 32),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              CustomButton(
                                onTap: () {
                                  model.signUp(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    fullName: fullNameController.text,
                                  );
                                },
                                bgColor: awesome,
                                shadowColor: awesome,
                                name: 'انشاء',
                              ),
                              CustomButton(
                                onTap: () {
                                  model.navigateToLogin();
                                },
                                name: 'لدى حساب',
                                isBorderd: true,
                                textColor: lightBlue,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        });
  }
}
