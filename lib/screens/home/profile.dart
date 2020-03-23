import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:bookit/widgets/custom_button.dart';
import 'package:bookit/widgets/provider_label.dart';
import 'package:bookit/ui/apptheme.dart';

TextEditingController emailController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();

String email;
String password;

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Center(
                      child: ClipRRect(
                        child: Image.asset(
                          'images/momo.jpg',
                          fit: BoxFit.fill,
                          height: 150,
                          width: 150,
                        ),
                        borderRadius: BorderRadius.circular(150),
                      ),
                    ),
                  ],
                )),
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      ' الاسم : محمد غانم',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'font1',
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    SizedBox(),
                    ProviderLabel(
                      color3: Colors.transparent,
                      color2: Colors.blueGrey,
                      color: Colors.transparent,
                      iconButton: IconButton(
                          icon: Icon(
                            Icons.location_on,
                            color: Colors.black,
                          ),
                          onPressed: null),
                      name: 'Damietta',
                    ),
                    ProviderLabel(
                      color3: Colors.transparent,
                      color2: Colors.blueGrey,
                      color: Colors.transparent,
                      iconButton: IconButton(
                          icon: Icon(Icons.mobile_screen_share,
                              color: Colors.black),
                          onPressed: null),
                      name: '+20-127-149-7356 ',
                    ),
                    ProviderLabel(
                      color3: Colors.transparent,
                      color2: Colors.blueGrey,
                      color: Colors.transparent,
                      iconButton: IconButton(
                          icon: Icon(Icons.email, color: Colors.black),
                          onPressed: null),
                      name: 'mohamedg7anem@gmail.com ',
                    ),
                  ],
                )),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  CustomButton(
                    name: 'الرجوع',
                    onTap: (){
                      Navigator.of(context).pushNamed('/HomePage');
                    },
                    color: Colors.blueGrey,
                    color3: darkBlue,
                    color2: white,


                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
