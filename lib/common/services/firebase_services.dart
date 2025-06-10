import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventlly/models/category_model.dart';
import 'package:eventlly/models/event_data_model.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseServices {
  static getEventsCollection() {
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

  static Future<void> addNewEvent(EventDataModel eventDataModel) async {
    CollectionReference<EventDataModel> eventsCollection =
        getEventsCollection();
    DocumentReference<EventDataModel> doc = eventsCollection.doc();
    eventDataModel.id = doc.id;
    await doc.set(eventDataModel);
  }

  static Future<List<EventDataModel>> getAllEvents({
    CategoryValues? categoryValue,
  }) async {
    CollectionReference<EventDataModel> eventsCollection =
        getEventsCollection();
    QuerySnapshot<EventDataModel> querySnapShoot =
        await eventsCollection
            .where('categoryValues', isEqualTo: categoryValue?.toJson()).orderBy('dateTime')
            .get();
    return querySnapShoot.docs.map((e) => e.data()).toList();
  }
}
