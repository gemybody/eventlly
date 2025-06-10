import 'package:eventlly/models/category_model.dart';

class EventDataModel {
  String id;
  String title;
  String descripetion;
  bool isFav;
  DateTime dateTime;
  CategoryValues categoryValues;

  EventDataModel({
    required this.title,
    required this.descripetion,
    this.isFav =false,
    required this.dateTime,
    required this.categoryValues,
      this.id='',
  });

  static List<EventDataModel> get dummyData => List.generate(
    8,
    (index) => EventDataModel(
      title: 'title$index',
      descripetion: 'xxxx' * index * 2,
      isFav: index % 2 == 0,
      dateTime: DateTime(2025, 5, index),
      categoryValues: CategoryValues.bookclub,
    ),
  );

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'title': title,
      'descripetion': descripetion,
      'isFav': isFav,
      'dateTime': dateTime.microsecondsSinceEpoch,
      'categoryValues': categoryValues.toJson(),
    };
  }

  static EventDataModel fromJson(Map<String, dynamic> json) {
    return EventDataModel(
      title: json['title'],
      descripetion: json['descripetion'],
      isFav: json['isFav'],
      id: json['id'],

      dateTime: DateTime.fromMicrosecondsSinceEpoch(json['dateTime']),
      categoryValues: CategoryValues.fromJson(json['categoryValues']),
    );
  }
}
