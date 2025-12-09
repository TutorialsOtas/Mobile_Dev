// lib/models/category_model.dart

import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<CategoryModel> getcategories() {
    List<CategoryModel> categories = [];

    // Sample Data (using const Color for efficiency)
    categories.add(
      CategoryModel(
        name: "Pizza",
        iconPath: "assets/icons/pizza.svg",
        boxColor: const Color(0xFFFFE5D9),
      ),
    );

    categories.add(
      CategoryModel(
        name: "Burger",
        iconPath: "assets/icons/burger.svg",
        boxColor: const Color(0xFFDFF6FF),
      ),
    );

    categories.add(
      CategoryModel(
        name: "Hotdog",
        iconPath: "assets/icons/hotdog.svg",
        boxColor: const Color(0xFFFFE0F7),
      ),
    );

    categories.add(
      CategoryModel(
        name: "Drink",
        iconPath: "assets/icons/drink.svg",
        boxColor: const Color(0xFFFEF3C7),
      ),
    );

    categories.add(
      CategoryModel(
        name: "Donut",
        iconPath: "assets/icons/donut.svg",
        boxColor: const Color(0xFFD1FAE5),
      ),
    );

    return categories;
  }
}
