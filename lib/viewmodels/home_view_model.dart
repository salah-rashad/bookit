import 'package:bookit/managers/locator.dart';
import 'package:bookit/models/activity.dart';
import 'package:bookit/services/firestore_service.dart';
import 'package:bookit/services/navigation_service.dart';
import 'package:bookit/ui/route_names.dart';

import 'base_model.dart';

class HomeViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();

  List<Activity> _activities;
  List<Activity> get posts => _activities;
  List<Activity> _activities1;
  List<Activity> get grag => _activities1;
  List<Activity> _activities2;
  List<Activity> get barber => _activities2;
  List<Activity> _activities3;
  List<Activity> get clinic => _activities3;
  List<Activity> _activities4;
  List<Activity> get wedding => _activities4;
  List<Activity> _activities5;
  List<Activity> get resturant => _activities5;

  void listenToPosts() {
    setBusy(true);

    _firestoreService.listenToActivitysRealTime().listen((postsData) {
      List<Activity> updatedPosts = postsData;
      if (updatedPosts != null && updatedPosts.length > 0) {
        _activities = updatedPosts;
        notifyListeners();
      }

      setBusy(false);
    });
    _firestoreService.listenToGragsRealTime().listen((postsData) {
      List<Activity> updatedPosts = postsData;
      if (updatedPosts != null && updatedPosts.length > 0) {
        _activities1 = updatedPosts;
        notifyListeners();
      }

      setBusy(false);
    });
  }

  void navigateToProviderView(int index) {
    _navigationService.navigateTo(ProviderScreenRoute,
        arguments: _activities[index]);
  }
}
