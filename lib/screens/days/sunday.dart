import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sunday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16,left: 16),
            child: Container(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('الى :',style:TextStyle(fontFamily: 'font1',),textDirection: TextDirection.rtl),
                      Text('من :',style:TextStyle(fontFamily: 'font1'),textDirection: TextDirection.rtl),
                    ],
                  ),
                  SizedBox(height: 50,),
                  Center(child: Text('مفتوح'),)

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}