import 'package:flutter/material.dart';

enum CategoryValue {
  all,
  sport,
  birthday,
  bookclub,
}

class CategoryModel {
  CategoryValue categoryValue;
  String title;
  IconData iconData;

  CategoryModel({
    required this.categoryValue,
    required this.title,
    required this.iconData,
  });

  static List<CategoryModel> get categories => [
        CategoryModel(
            categoryValue: CategoryValue.all,
            title: CategoryValue.all.name,
            iconData: Icons.explore_outlined),
        CategoryModel(
            categoryValue: CategoryValue.sport,
            title: CategoryValue.sport.name,
            iconData: Icons.directions_bike),
        CategoryModel(
            categoryValue: CategoryValue.birthday,
            title: CategoryValue.birthday.name,
            iconData: Icons.cake_outlined),
        CategoryModel(
            categoryValue: CategoryValue.bookclub,
            title: CategoryValue.bookclub.name,
            iconData: Icons.book_outlined),
      ];
}
