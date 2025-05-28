import 'package:eventlly/common/app_assets.dart';
import 'package:flutter/material.dart';

enum CategoryValues {
  all,
  sport,
  birthday,
  bookclub;

  String toTitle() {
    return name[0].toUpperCase() + name.substring(1);
  }

  String getDesgin() {
    switch (this) {
      case CategoryValues.all:
        return AppAssets.allCategory;

      case CategoryValues.sport:
        return AppAssets.SportCategory;

      case CategoryValues.birthday:
        return AppAssets.birthDayCategory;

      case CategoryValues.bookclub:
        return AppAssets.bookClubCategory;
    }
  }
}

class CategoryModel {
  CategoryValues categoryValue;
  String title;
  IconData iconData;

  CategoryModel({
    required this.categoryValue,
    required this.title,
    required this.iconData,
  });

  static List<CategoryModel> get categories => [
    CategoryModel(
      categoryValue: CategoryValues.all,
      title: CategoryValues.all.toTitle(),
      iconData: Icons.explore_outlined,
    ),
    CategoryModel(
      categoryValue: CategoryValues.sport,
      title: CategoryValues.sport.toTitle(),
      iconData: Icons.directions_bike,
    ),
    CategoryModel(
      categoryValue: CategoryValues.birthday,
      title: CategoryValues.birthday.toTitle(),
      iconData: Icons.cake_outlined,
    ),
    CategoryModel(
      categoryValue: CategoryValues.bookclub,
      title: CategoryValues.bookclub.toTitle(),
      iconData: Icons.book_outlined,
    ),
  ];
}
