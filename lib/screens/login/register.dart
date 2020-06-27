import 'package:bookit/ui/apptheme.dart';
import 'package:bookit/widgets/custom_button.dart';
import 'package:bookit/widgets/label_button.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(right: 32, left: 32, bottom: 32),
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    'انشاء حساب جديد',
                    style: AppTextStyle(color: darkBlue, size: 22.0).bold(),
                  ),
                )),
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  LabelButton(
                    image: Image.asset('images/email2.png'),
                    onTap: () {
                      Navigator.of(context).pushNamed('/EmailRegister');
                    },
                    name: 'الاستمرار بالايميل',
                    color: Colors.blueGrey,
                    color3: darkBlue,
                    color2: Colors.white,
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 12)),
                  LabelButton(
                    image: Image.asset(
                      'images/google2.png',
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed('/HomePage');
                    },
                    name: 'الاستمرار بجوجل',
                    color: offWhite,
                    color3: darkBlue,
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 12)),
                  LabelButton(
                    image: Image.asset('images/facebook2.png'),
                    onTap: () {
                      Navigator.of(context).pushNamed('/HomePage');
                    },
                    name: 'الاستمرار بفيسبوك',
                    color: Colors.blue,
                    color2: white,
                    color3: darkBlue,
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    CustomButton(
                      onTap: () {
                        Navigator.of(context).pushNamed('/LoginPage');
                      },
                      name: 'لدى حساب',
                      bgColor: grey1,
                      shadowColor: darkBlue,
                      textColor: darkBlue,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
