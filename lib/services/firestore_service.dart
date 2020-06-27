import 'dart:async';

import 'package:bookit/models/Customers.dart';
import 'package:bookit/models/activity.dart';
import 'package:bookit/models/uesr.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      Firestore.instance.collection('users');
  final CollectionReference _postsCollectionReference =
      Firestore.instance.collection('provider');
  final CollectionReference _gragCollectionReference =
      Firestore.instance.collection('جراجات');
  final CollectionReference _barberCollectionReference =
      Firestore.instance.collection('صالون حلاقه');
  final CollectionReference _clinicCollectionReference =
      Firestore.instance.collection('عيادات');
  final CollectionReference _weddingCollectionReference =
      Firestore.instance.collection('قاعات افراح');
  final CollectionReference _resturantCollectionReference =
      Firestore.instance.collection('مطاعم');
  final CollectionReference _customersCollectionReference =
      Firestore.instance.collection('customers');

  final StreamController<List<Activity>> _postsController =
      StreamController<List<Activity>>.broadcast();
  final StreamController<List<Activity>> _gragController =
      StreamController<List<Activity>>.broadcast();
  final StreamController<List<Activity>> _barberController =
      StreamController<List<Activity>>.broadcast();
  final StreamController<List<Activity>> _clinicController =
      StreamController<List<Activity>>.broadcast();
  final StreamController<List<Activity>> _weddingController =
      StreamController<List<Activity>>.broadcast();
  final StreamController<List<Activity>> _resturantController =
      StreamController<List<Activity>>.broadcast();

  final StreamController<List<Customers>> _customersController =
      StreamController<List<Customers>>.broadcast();

  Activity _currentActivity;
  Activity get currentActivity => _currentActivity;

  Future createUser(User user) async {
    try {
      await _usersCollectionReference.document(user.id).setData(user.toJson());
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.document(uid).get();
      return User.fromData(userData.data);
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future getPostsOnceOff() async {
    try {
      var postDocumentSnapshot = await _postsCollectionReference.getDocuments();
      var gragDocumentSnapshot = await _gragCollectionReference.getDocuments();
      var barbertDocumentSnapshot =
          await _barberCollectionReference.getDocuments();
      var clinicDocumentSnapshot =
          await _clinicCollectionReference.getDocuments();
      var resturantDocumentSnapshot =
          await _resturantCollectionReference.getDocuments();
      var weddingDocumentSnapshot =
          await _weddingCollectionReference.getDocuments();

      if (postDocumentSnapshot.documents.isNotEmpty) {
        postDocumentSnapshot.documents
            .map((snapshot) =>
                Activity.fromMap(snapshot.data, snapshot.documentID))
            .where((mappedItem) => mappedItem.name != null)
            .toList();
      }
      if (gragDocumentSnapshot.documents.isNotEmpty) {
        postDocumentSnapshot.documents
            .map((snapshot) =>
                Activity.fromMap(snapshot.data, snapshot.documentID))
            .where((mappedItem) => mappedItem.name != null)
            .toList();
      }
      if (barbertDocumentSnapshot.documents.isNotEmpty) {
        postDocumentSnapshot.documents
            .map((snapshot) =>
                Activity.fromMap(snapshot.data, snapshot.documentID))
            .where((mappedItem) => mappedItem.name != null)
            .toList();
      }
      if (clinicDocumentSnapshot.documents.isNotEmpty) {
        postDocumentSnapshot.documents
            .map((snapshot) =>
                Activity.fromMap(snapshot.data, snapshot.documentID))
            .where((mappedItem) => mappedItem.name != null)
            .toList();
      }
      if (resturantDocumentSnapshot.documents.isNotEmpty) {
        postDocumentSnapshot.documents
            .map((snapshot) =>
                Activity.fromMap(snapshot.data, snapshot.documentID))
            .where((mappedItem) => mappedItem.name != null)
            .toList();
      }
      if (weddingDocumentSnapshot.documents.isNotEmpty) {
        postDocumentSnapshot.documents
            .map((snapshot) =>
                Activity.fromMap(snapshot.data, snapshot.documentID))
            .where((mappedItem) => mappedItem.name != null)
            .toList();
      }
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Stream listenToActivitysRealTime() {
    // Register the handler for when the posts data changes
    _postsCollectionReference.snapshots().listen((postsSnapshot) {
      if (postsSnapshot.documents.isNotEmpty) {
        var posts = postsSnapshot.documents
            .map((snapshot) =>
                Activity.fromMap(snapshot.data, snapshot.documentID))
            .where((mappedItem) => mappedItem.name != null)
            .toList();

        // Add the posts onto the controller
        _postsController.add(posts);
      }
    });

    return _postsController.stream;
  }

  Stream listenToGragsRealTime() {
    // Register the handler for when the posts data changes
    _gragCollectionReference.snapshots().listen((postsSnapshot) {
      if (postsSnapshot.documents.isNotEmpty) {
        var posts = postsSnapshot.documents
            .map((snapshot) =>
                Activity.fromMap(snapshot.data, snapshot.documentID))
            .where((mappedItem) => mappedItem.name != null)
            .toList();

        // Add the posts onto the controller
        _gragController.add(posts);
      }
    });

    return _gragController.stream;
  }

  // for customers

  Future createActivity(Activity activity) async {
    try {
      await _usersCollectionReference
          .document(activity.activityId)
          .setData(activity.toMap());
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future getActivity(String activityId) async {
    try {
      var activityData =
          await _postsCollectionReference.document(activityId).get();
      return Activity.fromMap(activityData.data, activityData.documentID);
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future addCustomer(Customers customer) async {
    try {
      await _customersCollectionReference.add(customer.toMap());
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future updateCustomer(Customers customer) async {
    try {
      await _customersCollectionReference
          .document(customer.documentId)
          .updateData(customer.toMap());
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future getCustomersOnceOff() async {
    try {
      var customerDocumentSnapshot =
          await _customersCollectionReference.getDocuments();
      if (customerDocumentSnapshot.documents.isNotEmpty) {
        return customerDocumentSnapshot.documents
            .map((snapshot) =>
                Customers.fromMap(snapshot.data, snapshot.documentID))
            .where((mappedItem) => mappedItem.custName != null)
            .toList();
      }
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Stream listenToCustomersRealTime() {
    // Register the handler for when the posts data changes
    _customersCollectionReference.snapshots().listen((postsSnapshot) {
      if (postsSnapshot.documents.isNotEmpty) {
        var customers = postsSnapshot.documents
            .map((snapshot) =>
                Customers.fromMap(snapshot.data, snapshot.documentID))
            .where((mappedItem) => mappedItem.custName != null)
            .toList();

        // Add the posts onto the controller
        _customersController.add(customers);
      }
    });

    return _customersController.stream;
  }
  Future deletePost(String documentId) async {
    await _customersCollectionReference.document(documentId).delete();
  }

  Future updatePost(Activity activity) async {
    try {
      await _customersCollectionReference
          .document(activity.documentId)
          .updateData(activity.toMap());
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }
}
