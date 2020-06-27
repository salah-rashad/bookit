import 'package:bookit/ui/apptheme.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 12.0),
            child: Text(
              'الاعدادات',
              style: AppTextStyle(color: darkBlue, size: 18.0).bold(),
            ),
            height: 80,
            decoration: BoxDecoration(
                color: offWhite,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
                boxShadow: [
                  BoxShadow(
                      color: darkBlue,
                      blurRadius: 45,
                      offset: Offset(0, 4),
                      spreadRadius: -15)
                ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CustomSwitch(
                      activeColor: awesome,
                      value: status,
                      onChanged: (value) {
                        setState(() {
                          status = value;
                        });
                      },
                    ),
                    Text(
                      'الوضع المظلم',
                      style: TextStyle(
                          fontFamily: 'font1',
                          color: Colors.black,
                          fontSize: 16),
                      textDirection: TextDirection.rtl,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CustomSwitch(
                      activeColor: awesome,
                      value: status,
                      onChanged: (value) {
                        setState(() {
                          status = value;
                        });
                      },
                    ),
                    Text(
                      'الاشعارات',
                      style: TextStyle(
                          fontFamily: 'font1',
                          color: Colors.black,
                          fontSize: 16),
                      textDirection: TextDirection.rtl,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'عن التطبيق',
                      style: TextStyle(
                          fontFamily: 'font1',
                          color: Colors.black,
                          fontSize: 16),
                      textDirection: TextDirection.rtl,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
