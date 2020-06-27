import 'package:bookit/managers/locator.dart';
import 'package:bookit/models/activity.dart';
import 'package:bookit/models/uesr.dart';
import 'package:bookit/services/authentication_service.dart';
import 'package:bookit/services/firestore_service.dart';
import 'package:flutter/widgets.dart';

class BaseModel extends ChangeNotifier {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  User get currentUser => _authenticationService.currentUser;
  Activity get currentActivity => _firestoreService.currentActivity;

  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
