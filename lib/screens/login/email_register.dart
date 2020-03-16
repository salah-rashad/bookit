import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookit/model/custom_button.dart';
import 'package:bookit/model/custom_textfield.dart';
import 'package:bookit/ui/apptheme.dart';

TextEditingController nameController = new TextEditingController();
TextEditingController newEmailController = new TextEditingController();
TextEditingController newPasswordController = new TextEditingController();

String name;
String newEmail;
String newPassword;


class EmailRegister extends StatefulWidget {
  @override
  _EmailRegisterState createState() => _EmailRegisterState();
}

class _EmailRegisterState extends State<EmailRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Text('انشاء حساب جديد',style: TextStyle(fontSize: 24,fontFamily: 'font1'),)
                ],
              ),

            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CustomTextField(
                      hintName: 'الاسم',
                      directionality: TextDirection.rtl,
                      controller: nameController,
                      secure: false,
                      color3:darkBlue,
                      color: offWhite,
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 12)),
                    CustomTextField(
                      hintName: 'الايميل',
                      directionality: TextDirection.rtl,
                      controller: newEmailController,
                      secure: false,
                      color3:darkBlue,
                      color: offWhite,
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 12)),
                    CustomTextField(
                      hintName: 'كلمة المرور',
                      directionality: TextDirection.rtl,
                      controller: newPasswordController,
                      secure: true,
                      color3:darkBlue,
                      color: offWhite,
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
                      onTap: (){
                        setState(() {
                          name = nameController.text;
                          newEmail = newEmailController.text;
                          newPassword = newPasswordController.text;
                        });
                        Navigator.of(context).pushNamed('/HomePage');

                      } ,
                      color: awesome,
                      color3: darkBlue,
                      name: 'انشاء',
                    ),
                    CustomButton(
                      onTap: (){
                        Navigator.of(context).pushNamed('/LoginPage');
                      } ,
                      name: 'لدى حساب',
                      color: grey1,
                      color3: darkBlue,
                      color2: darkBlue,
                    ),


                  ],
                ),
              ),

            ),

          ],
        ),
      ),
    );
  }
}
