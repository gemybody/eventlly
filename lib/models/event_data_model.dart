import 'package:eventlly/models/category_model.dart';

class EventDataModel {
  String title;
  String discripetion;
  bool isFav;
  DateTime dateTime;
  CategoryValues categoryValue;

  EventDataModel({
    required this.title,
    required this.discripetion,
    required this.isFav,
    required this.dateTime,
    required this.categoryValue,
  });

  static List<EventDataModel> get dummyData => List.generate(
    8,
    (index) => EventDataModel(
      title: 'title$index',
      discripetion: 'xxxx' * index*2,
      isFav: index % 2 == 0,
      dateTime: DateTime(2025, 5, index),
      categoryValue: CategoryValues.bookclub,
    ),
  );
}
