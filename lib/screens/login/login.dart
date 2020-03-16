import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:bookit/model/custom_textfield.dart';
import 'package:bookit/model/circular_button.dart';
import 'package:bookit/model/custom_button.dart';
import 'package:bookit/ui/apptheme.dart';


TextEditingController emailController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();


String email;
String password;


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.only(right: 32,left: 32),
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ClipRRect(

                      child:Image.asset('images/logo2.png',
                        fit: BoxFit.fill,
                      height: 150,
                        width: 150,
                      ),

                      borderRadius: BorderRadius.circular(50),
                    ),
                    Text('تسجيل الدخول',style: TextStyle(fontSize: 24,fontFamily: 'font1'))
                  ],
                )
            ),
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    CustomTextField(
                      directionality: TextDirection.rtl,
                      controller: emailController,
                      hintName: 'الايميل',
                      color: offWhite,
                      secure: false,
                      color3: darkBlue,

                    ),
                    Padding(padding: EdgeInsets.only(bottom: 12)),
                    CustomTextField(
                      directionality: TextDirection.rtl,
                      controller: passwordController,
                      hintName: 'كلمة المرور',
                      color: offWhite,
                      secure: true,
                      color3: darkBlue,

                    ),
                    Padding(padding: EdgeInsets.only(bottom: 12)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CircularButton(
                              onTap: (){
                                Navigator.of(context).pushNamed('/HomePage');
                              } ,
                              color3: darkBlue,
                              color: darkBlue,
                              image: Image.asset('images/google.png'),


                            ),
                            SizedBox(
                              width: 6,
                            ),
                            CircularButton(
                              onTap: (){
                                Navigator.of(context).pushNamed('/HomePage');
                              } ,
                              color3: grey1,
                              color: darkBlue,
                              image: Image.asset('images/f_white.png'
                                ,fit: BoxFit.fill,
                              ),

                            ),
                          ],
                        ),
                        CustomButton(
                          onTap: (){
                            Navigator.of(context).pushNamed('/ForgotPassword');
                          } ,
                          name: ('نسيت كلمة المرور ؟'),
                          color: Colors.transparent,
                          color3: Colors.transparent,


                        ),


                      ],
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 12))
                  ],
                )
            ),
            Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Column(


                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CustomButton(
                        onTap: (){
                          setState(() {
                            email = emailController.text;
                            password = passwordController.text;
                          });
                          Navigator.of(context).pushNamed('/HomePage');
                        } ,
                        name: 'الدخول',
                        color: awesome,
                        color3: darkBlue,

                      ),
                      CustomButton(
                        name: 'انشاء حساب جديد',
                        onTap: (){
                          Navigator.of(context).pushNamed('/Register');
                        },
                        color: grey1,
                        color3: darkBlue,
                        color2: darkBlue,


                      ),


                    ],
                  ),
                )
            ),

          ],
        ),
      ),
    );
  }
}
