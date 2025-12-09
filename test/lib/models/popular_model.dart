// lib/models/popular_model.dart

import 'package:flutter/material.dart';

class PopularModel {
  String name;
  String iconPath;
  Color boxColor;
  String complexity;
  String time;

  PopularModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
    required this.complexity,
    required this.time,
  });

  static List<PopularModel> getPopularDiets() {
    List<PopularModel> popularDiets = [];

    popularDiets.add(
      PopularModel(
        name: 'Blueberry Pancake',
        iconPath: 'assets/icons/blueberry.svg',
        boxColor: const Color(0xFFFEF3C7),
        complexity: 'Medium',
        time: '30min',
      ),
    );

    popularDiets.add(
      PopularModel(
        name: 'Salmon Salad',
        iconPath: 'assets/icons/salad.svg',
        boxColor: const Color(0xff92A3FD),
        complexity: 'Easy',
        time: '15min',
      ),
    );

    popularDiets.add(
      PopularModel(
        name: 'Keto Avocado Toast',
        iconPath: 'assets/icons/bread.svg',
        boxColor: const Color(0xffC58BF2),
        complexity: 'Medium',
        time: '20min',
      ),
    );

    return popularDiets;
  }
}
