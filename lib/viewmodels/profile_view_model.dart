import 'package:bookit/managers/locator.dart';
import 'package:bookit/services/authentication_service.dart';
import 'package:bookit/services/dialog_service.dart';
import 'package:bookit/viewmodels/base_model.dart';
import 'package:flutter/cupertino.dart';

class ProfileModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();

  Future<void> signOut(BuildContext context) async {
    print("here");
    var dialogResponse = await _dialogService.showConfirmationDialog(
      title: 'Are you sure?',
      description: 'Do you really want to sign out?',
      confirmationTitle: 'Yes',
      cancelTitle: 'No',
    );

    if (dialogResponse.confirmed) {
      setBusy(true);
      await _authenticationService.signOut(context);
      setBusy(false);
    }
  }
}
