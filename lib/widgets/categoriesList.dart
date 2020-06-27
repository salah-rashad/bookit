import 'package:bookit/ui/apptheme.dart';
import 'package:bookit/viewmodels/home_view_model.dart';
import 'package:bookit/widgets/provider_activity.dart';
import 'package:bookit/widgets/provider_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class Category extends StatelessWidget {
  final String category;
  final String name;
  final String ratings;

  const Category({Key key, this.category, this.name, this.ratings})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewModel>.withConsumer(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (model) => model.listenToPosts(),
        builder: (context, model, child) => Container(
              child: Column(
                children: <Widget>[
                  Container(
                      child: ListView.builder(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          physics: ScrollPhysics(parent: PageScrollPhysics()),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: activities.length,
                          itemBuilder: (BuildContext context, int index) {
                            ProviderActivity activity = activities[index];
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 8.0),
                              height: 90,
                              decoration: BoxDecoration(
                                color: offWhite,
                                borderRadius: BorderRadius.circular(26.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: darkBlue.withOpacity(0.16),
                                    blurRadius: 20,
                                    offset: Offset(0, 4),
                                  )
                                ],
                              ),
                              child: InkWell(
                                onTap: () =>
                                    model.navigateToProviderView(index),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Column(
//                                      mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,

                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.only(top: 5),
                                            ),
                                            Text(
                                              category,
                                              style: AppTextStyle(
                                                      color: lightBlue,
                                                      size: 12.0)
                                                  .semiBold(),
                                              textAlign: TextAlign.right,
                                              textDirection: TextDirection.rtl,
                                            ),
                                            Text(
                                              name,
                                              style: TextStyle(
                                                  fontFamily: 'font1',
                                                  fontSize: 15,
                                                  color: Colors.black),
                                              textAlign: TextAlign.right,
                                              textDirection: TextDirection.rtl,
                                            ),
                                            Text(
                                              ratings,
                                              style: TextStyle(
                                                  fontFamily: 'font1',
                                                  fontSize: 10,
                                                  color: awesome),
                                              textAlign: TextAlign.right,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0, vertical: 12.0),
                                      child: CircleAvatar(
                                        radius: 32,
                                        child: Image.asset(
                                            'images/default_image.png'),
                                        backgroundColor: grey1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })),
                ],
              ),
            ));
  }
}
