// lib/models/diet_model.dart

import 'package:flutter/material.dart';

class DietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calories;
  Color boxColor;
  bool viewIsSelected;

  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calories,
    required this.boxColor,
    required this.viewIsSelected,
  });

  static List<DietModel> getDiets() {
    List<DietModel> diets = [];

    diets.add(
      DietModel(
        name: 'Honey and Lemon',
        iconPath: 'assets/icons/honey-lemon.svg',
        level: 'Easy',
        duration: '30 min',
        calories: '180kCal',
        boxColor: const Color(0xff92A3FD),
        viewIsSelected: true,
      ),
    );

    diets.add(
      DietModel(
        name: 'Oatmeal Diet',
        iconPath: 'assets/icons/oatmeal.svg',
        level: 'Medium',
        duration: '20 min',
        calories: '230kCal',
        boxColor: const Color(0xffC58BF2),
        viewIsSelected: false,
      ),
    );

    diets.add(
      DietModel(
        name: 'Keto Diet',
        iconPath: 'assets/icons/blueberry.svg',
        level: 'Hard',
        duration: '60 min',
        calories: '500kCal',
        boxColor: const Color(0xff92A3FD),
        viewIsSelected: false,
      ),
    );

    return diets;
  }
}
