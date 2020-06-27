import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Day extends StatelessWidget {
  final String from;
  final String to;
  final String state;

  const Day({Key key, this.from, this.to, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
         Padding(
                  padding: const EdgeInsets.only(right: 16, left: 16),
                  child: Container(
                    child: Column(
                      children: <Widget>[

                        Padding(
                          padding:  EdgeInsets.only(top:8,left: 20,right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(from,
                                  style: TextStyle(
                                    fontFamily: 'font1',
                                  ),
                                  textDirection: TextDirection.rtl),
                              Text(to,
                                  style: TextStyle(fontFamily: 'font1'),
                                  textDirection: TextDirection.rtl),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Center(
                          child: Text(state,
                            style: TextStyle(
                              fontFamily: 'font1',fontSize: 24
                            ),),
                        )
                      ],
                    ),
                  ),
               ),
        ],
      ),
    );
  }
}
