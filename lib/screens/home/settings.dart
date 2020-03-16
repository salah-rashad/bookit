//import 'package:flutter/material.dart';
//import 'package:custom_switch/custom_switch.dart';
//
//class Settings extends StatefulWidget {
//  @override
//  _SettingsState createState() => _SettingsState();
//}
//
//class _SettingsState extends State<Settings> {
//  bool status = false;
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: PreferredSize(
//        child: AppBar(
//          title: Text('Custom Switch Example'),
//
//        ),
//      ),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.start,
//          children: <Widget>[
//            Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                CustomSwitch(
//                  activeColor: Colors.pinkAccent,
//                  value: status,
//                  onChanged: (value) {
//                    print("VALUE : $value");
//                    setState(() {
//                      status = value;
//                    });
//                  },
//                ),
//                Text('Value : $status', style: TextStyle(
//                    color: Colors.black,
//                    fontSize: 20.0
//                ),
//                )
//              ],
//            ),
//
//          ],
//        ),
//      ),
//    );
//  }
//}