import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventlly/models/category_model.dart';
import 'package:eventlly/models/event_data_model.dart';
import 'package:eventlly/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  static Future<UserModel?> logInUser({
    required String email,
    required String password,
  }) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    if (userCredential.user?.uid != null) {
      var userModel = await _getUserInfo(userCredential.user!.uid);
      return userModel;
    }
    return null;
  }

  static Future<UserModel> registerUser({
    required String email,
    required String password,
    required String name,
  }) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    UserModel userModel = UserModel(
      email: email,
      name: name,
      uid: userCredential.user!.uid,
    );
    await _addNewUser(userModel);
    return userModel;
  }

  ////////////////////////////////////////////////////////////////////////////
  static CollectionReference<UserModel> getUserCollection() {
    CollectionReference<UserModel> userCollection = FirebaseFirestore.instance
        .collection('Users')
        .withConverter<UserModel>(
          fromFirestore:
              (snapshot, _) => UserModel.fromJson(snapshot.data() ?? {}),
          toFirestore: (value, _) => value.toJson(),
        );
    return userCollection;
  }

  ////////////////////////////////////////////////////////////////////////////
  static Future<void> _addNewUser(UserModel user) async {
    CollectionReference<UserModel> userCollection = getUserCollection();
    DocumentReference<UserModel> doc = userCollection.doc(user.uid);
    await doc.set(user);
  }

  ////////////////////////////////////////////////////////////////////////////
  static Future<UserModel?> _getUserInfo(String uid) async {
    CollectionReference<UserModel> userCollection = getUserCollection();
    var doc = await userCollection.doc(uid).get();
    return doc.data();
  }

  ////////////////////////////////////////////////////////////////////////////

  static CollectionReference<EventDataModel> getEventsCollection() {
    CollectionReference<EventDataModel> eventCollection = FirebaseFirestore
        .instance
        .collection('Events')
        .withConverter<EventDataModel>(
          fromFirestore:
              (snapshot, _) => EventDataModel.fromJson(snapshot.data() ?? {}),
          toFirestore: (value, _) => value.toJson(),
        );
    return eventCollection;
  }

  ///////////////////////////////////////////////////////////////////////////////
  static Future<void> addNewEvent(EventDataModel eventDataModel) async {
    CollectionReference<EventDataModel> eventsCollection =
        getEventsCollection();
    DocumentReference<EventDataModel> doc = eventsCollection.doc();
    eventDataModel.id = doc.id;
    await doc.set(eventDataModel);
  }

  ////////////////////////////////////////////////////////////////////////////
  static Future<List<EventDataModel>> getAllEvents({
    CategoryValues? categoryValue,
  }) async {
    CollectionReference<EventDataModel> eventsCollection =
        getEventsCollection();
    QuerySnapshot<EventDataModel> querySnapShoot =
        await eventsCollection
            .where('categoryValues', isEqualTo: categoryValue?.toJson())
            .orderBy('dateTime')
            .get();
    return querySnapShoot.docs.map((e) => e.data()).toList();
  }
}
