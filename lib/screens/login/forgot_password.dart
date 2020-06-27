import 'package:bookit/ui/apptheme.dart';
import 'package:bookit/widgets/custom_button.dart';
import 'package:bookit/widgets/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


TextEditingController restoreEmailController = new TextEditingController();

String restoreEmail;

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
                child: Center(
                  child:Text('نسيت كلمة المرور؟',style: TextStyle(fontSize: 24,fontFamily: 'font1'),)
                  ,
                )
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CustomTextFormField(
                      directionality: TextDirection.rtl,
                      controller: restoreEmailController,
                      hintText: 'الايميل',
                      secure: false,
                      bgColor: offWhite,
                      shadowColor: darkBlue,

                    ),
                    Padding(padding: EdgeInsets.only(bottom: 12)),
                    CustomButton(
                      onTap: (){
                        setState(() {
                          restoreEmail = restoreEmailController.text;
                        });
                        Navigator.of(context).pushNamed('/Confirmation');

                      } ,
                      name: 'متابعة',
                      bgColor: darkBlue,
                      textColor: Colors.white,
                      shadowColor: darkBlue,


                    ),

                  ],
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CustomButton(
                      onTap: (){
                        Navigator.of(context).pushNamed('/LoginPage');
                      } ,
                      name: 'الرجوع <<',
                      shadowColor: Colors.transparent,

                    ),
                  ],
                )
            ),

          ],
        ),
      ),
    );
  }
}
