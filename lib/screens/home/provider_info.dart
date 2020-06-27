import 'package:bookit/models/activity.dart';
import 'package:bookit/screens/home/days.dart';
import 'package:bookit/ui/apptheme.dart';
import 'package:bookit/viewmodels/provider_model.dart';
import 'package:bookit/widgets/provider_circular.dart';
import 'package:bookit/widgets/provider_label.dart';
import "package:flutter/material.dart";
import 'package:provider_architecture/_viewmodel_provider.dart';

class ProviderInfo extends StatelessWidget {
  String nameController;
  final Activity edittingPost;
  ProviderInfo({Key key, this.edittingPost, this.nameController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ProviderModel>.withConsumer(
        viewModelBuilder:() => ProviderModel(),
        onModelReady: (model) {
          // update the text in the controller
          nameController = edittingPost?.name ?? '';
        },
        builder: (context, model, child) => ListView(
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
                                onPressed: model.navigateToCustomerseView,
                              ),
                              color: darkBlue,
                              onTap: model.navigateToCustomerseView(),
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
                            icon: Icon(Icons.exposure_plus_1,
                                color: Colors.black),
                            color: Colors.teal,
                            onPressed: model.navigateToBook,
                          ),
                          color: darkBlue,
                          onTap: () {},
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
                        nameController,
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

                    Days()
                  ],
                )),
              ],
            ));
  }
}
