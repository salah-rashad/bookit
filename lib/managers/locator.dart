import 'package:bookit/services/authentication_service.dart';
import 'package:bookit/services/cloud_storage_service.dart';
import 'package:bookit/services/dialog_service.dart';
import 'package:bookit/services/firestore_service.dart';
import 'package:bookit/services/navigation_service.dart';
import 'package:get_it/get_it.dart';

import 'image_selector.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => FirestoreService());
  locator.registerLazySingleton(() => CloudStorageService());
  locator.registerLazySingleton(() => ImageSelector());
}
