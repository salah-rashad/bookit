import 'package:bookit/managers/locator.dart';
import 'package:bookit/models/Customers.dart';
import 'package:bookit/services/dialog_service.dart';
import 'package:bookit/services/firestore_service.dart';
import 'package:bookit/services/navigation_service.dart';
import 'package:flutter/cupertino.dart';

import 'base_model.dart';

class BookViewModel extends BaseModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Customers _edittingCustomer;

  bool get _editting => _edittingCustomer != null;

  Future addCustomer({@required String custName,time}) async {
    setBusy(true);

    var result;

    if (!_editting) {
      result = await _firestoreService
          .addCustomer(Customers(custName:custName, time:time, activityId: currentUser.id));
    } else {
      result = await _firestoreService.updateCustomer(Customers(
        custName:custName,
        time: time,
        activityId: _edittingCustomer.activityId,
        documentId: _edittingCustomer.documentId,
      ));
    }

    setBusy(false);

    if (result is String) {
      await _dialogService.showDialog(
        title: 'Cound not create post',
        description: result,
      );
    } else {
      await _dialogService.showDialog(
        title: 'Post successfully Added',
        description: 'Your post has been created',
      );
    }

    _navigationService.pop();
  }

  void setEdittingCustomer(Customers edittingCustomer) {
    _edittingCustomer = edittingCustomer;
  }
}
