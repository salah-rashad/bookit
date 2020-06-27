import 'package:bookit/ui/apptheme.dart';
import 'package:bookit/viewmodels/book_view_model.dart';
import 'package:bookit/widgets/custom_button.dart';
import 'package:bookit/widgets/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class Book extends StatelessWidget {
  final Function toggleView;
  Book({this.toggleView});
  final nameController = TextEditingController();
  final waitingTimeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String name = '';

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<BookViewModel>.withConsumer(
        viewModelBuilder: () => BookViewModel(),
        builder: (context, model, child) => Scaffold(
                body: Container(
              padding: EdgeInsets.only(right: 32, left: 32),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          ClipRRect(
                            child: Image.asset(
                              'images/logo2.png',
                              fit: BoxFit.fill,
                              height: 150,
                              width: 150,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          Text(
                            'انشاء حساب جديد',
                            style: TextStyle(fontSize: 24, fontFamily: 'font1'),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CustomTextFormField(
                              hintText: 'الاسم',
                              controller: nameController,
                              directionality: TextDirection.rtl,
                              secure: false,
                              shadowColor: darkBlue,
                              bgColor: offWhite,
                              validator: (val) =>
                                  val.isEmpty ? 'Enter an name' : null,
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 12)),
                            CustomTextFormField(
                              hintText: 'الوقت',
                              controller: waitingTimeController,
                              directionality: TextDirection.rtl,
                              secure: false,
                              shadowColor: darkBlue,
                              bgColor: offWhite,
                              validator: (val) =>
                                  val.isEmpty ? 'Enter an time' : null,
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 12)),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.only(bottom: 32),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CustomButton(
                              onTap: () {
                                model.addCustomer(
                                    custName: nameController.text,
                                    time: waitingTimeController.text);
                              },
                              bgColor: awesome,
                              shadowColor: darkBlue,
                              name: 'حجز',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
