import 'package:flutter/material.dart';
import 'dart:ui';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  //constructor-class
  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  List<CategoryModel> getcategories() {
    List<CategoryModel> categories = [];
    CategoryModel categoryModel;

    //1
    categoryModel = CategoryModel(
      name: "Pizza",
      iconPath: "assets/icons/pizza.svg",
      boxColor: Color(0xFFFFE5D9),
    );
    categories.add(categoryModel);

    //2
    categoryModel = CategoryModel(
      name: "Burger",
      iconPath: "assets/icons/burger.svg",
      boxColor: Color(0xFFDFF6FF),
    );
    categories.add(categoryModel);

    //3
    categoryModel = CategoryModel(
      name: "Hotdog",
      iconPath: "assets/icons/hotdog.svg",
      boxColor: Color(0xFFFFE0F7),
    );
    categories.add(categoryModel);

    //4
    categoryModel = CategoryModel(
      name: "Drink",
      iconPath: "assets/icons/drink.svg",
      boxColor: Color(0xFFFEF3C7),
    );
    categories.add(categoryModel);

    //5
    categoryModel = CategoryModel(
      name: "Donut",
      iconPath: "assets/icons/donut.svg",
      boxColor: Color(0xFFD1FAE5),
    );
    categories.add(categoryModel);

    return categories;
  }
}
