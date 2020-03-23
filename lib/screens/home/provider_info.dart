import "package:flutter/material.dart";
import 'package:bookit/widgets/provider_circular.dart';
import 'package:bookit/widgets/provider_label.dart';
import 'package:bookit/ui/apptheme.dart';
import 'package:bookit/screens/home/days.dart';


class ProviderInfo extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        ProviderCircular(
                          color3: darkBlue,
                          icon: IconButton(
                            icon: Icon(Icons.supervised_user_circle,
                                color: Colors.black),
                            color: Colors.teal,
                            onPressed: null,
                          ),
                          color: darkBlue,
                          onTap: () {},
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        ProviderCircular(
                          color3: darkBlue,
                          icon: IconButton(
                            icon: Icon(
                              Icons.announcement,
                              color: Colors.black,
                            ),
                            color: Colors.teal,
                            onPressed: null,
                          ),
                          color: darkBlue,
                          onTap: () {},
                        ),
                      ],
                    ),
                    ProviderCircular(
                      color3: darkBlue,
                      icon: IconButton(
                        icon: Icon(Icons.favorite, color: Colors.black),
                        color: Colors.teal,
                        onPressed: null,
                      ),
                      color: darkBlue,
                      onTap: () {
                        Navigator.of(context);
                      },
                    ),
                  ],
                ),

                Container(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Text(
                    'مستشفى',
                    style: TextStyle(
                      fontFamily: 'font1',
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  alignment: Alignment.centerRight,
                ),
                Container(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Text(
                    'السعودى الألمانى',
                    style: TextStyle(
                      fontFamily: 'font1',
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  alignment: Alignment.centerRight,
                ),
                Container(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Text(
                    '4.4 / 5',
                    style: TextStyle(
                      fontFamily: 'font1',
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  alignment: Alignment.centerRight,
                ),

//                          Column(
//                            children: <Widget>[
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
                  name: 'القاهرة،مدينة السلام،بجوار فندق شيراتون ',
                ),

                ProviderLabel(
                  color3: Colors.transparent,
                  color2: Colors.blueGrey,
                  color: Colors.transparent,
                  iconButton: IconButton(
                      icon: Icon(Icons.mobile_screen_share, color: Colors.black),
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

                Days()

              ],
            )),
      ],
    );
  }

}

