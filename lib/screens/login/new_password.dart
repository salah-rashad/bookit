import 'package:flutter/material.dart';
import 'package:bookit/widgets/custom_button.dart';
import 'package:bookit/widgets/custom_textfield.dart';
import 'package:bookit/ui/apptheme.dart';


TextEditingController changedPasswordController = new TextEditingController();
TextEditingController samePasswordController = new TextEditingController();

String changedPassword;
String samePassword;

class NewPassword extends StatefulWidget {
  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
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
                  child:Text('اكتب كلمة المرور الجديدة',style: TextStyle(fontSize: 24,fontFamily: 'font1'),)
                  ,
                )
            ),
            Expanded(
              flex: 1,
              child:  Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    CustomTextFormField(
                      directionality: TextDirection.rtl,
                      hintText: 'كلمة المرور',
                      controller: changedPasswordController,
                      secure: true,
                      bgColor: offWhite,
                      shadowColor: darkBlue,

                    ),
                    Padding(padding: EdgeInsets.only(bottom: 12)),

                    CustomTextFormField(
                      directionality: TextDirection.rtl,
                      hintText: 'تأكيد كلمة المرور',
                      controller: samePasswordController,
                      secure: true,
                      bgColor: offWhite,
                      shadowColor: darkBlue,
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 12)),
                    CustomButton(
                      onTap: (){
                        setState(() {
                          changedPassword = changedPasswordController.text;
                          samePassword = samePasswordController.text;
                        });
                        Navigator.of(context).pushNamed('/HomePage');


                      } ,
                      bgColor: darkBlue,
                      name: 'المتابعة',
                      shadowColor: darkBlue,
                      textColor: Colors.white,

                    ),

                  ],
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(bottom: 32),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
