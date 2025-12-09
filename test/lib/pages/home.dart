// lib/pages/home.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/models/category_model.dart';
import 'package:test/models/diet_model.dart';
import 'package:test/models/popular_model.dart';

// HomePage is a StatefulWidget because it needs to load data once when it starts.
class HomePage extends StatefulWidget {
  // Uses the modern 'super.key' for the constructor.
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Lists are initialized as empty lists.
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularModel> popularDiets = [];

  // Function to load all data from the Models.
  void _getInitialInfo() {
    categories = CategoryModel.getcategories();
    diets = DietModel.getDiets();
    popularDiets = PopularModel.getPopularDiets();
  }

  @override
  void initState() {
    super.initState();
    _getInitialInfo();
  }

  // The build method defines the main layout.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. The App Bar
      appBar: _appBar(),

      // 2. The Main Body (wrapped in ListView to allow scrolling)
      body: ListView(
        children: [
          _searchBar(),
          const SizedBox(height: 30),
          _categoriesSection(),
          const SizedBox(height: 30),
          _recommendedSection(),
          const SizedBox(height: 30),
          _popularSection(),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  // --- WIDGET BUILDING FUNCTIONS ---

  // Builds the custom App Bar.
  AppBar _appBar() {
    return AppBar(
      title: const Text(
        'Meal Monkey',
        style: TextStyle(
          color: Colors.yellow,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.blueAccent,
      centerTitle: true,
      elevation: 4,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.all(8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
          ),
          child: SvgPicture.asset(
            'assets/icons/arrow.svg',
            // Using colorFilter for non-deprecated icon coloring.
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            height: 20,
            width: 20,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            height: 40,
            width: 40,
            child: SvgPicture.asset(
              'assets/icons/3dots.svg',
              // Using colorFilter
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
              height: 20,
              width: 20,
            ),
          ),
        ),
      ],
    );
  }

  // Builds the Search Bar widget.
  Container _searchBar() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            // Using withAlpha(28) for 0.11 opacity (no deprecated warnings)
            color: const Color(0xff1D1617).withAlpha(28),
            blurRadius: 40,
            spreadRadius: 0.0,
          ),
        ],
      ),
      // FIX: Removed 'const' from TextField because it takes dynamic user input.
      child: TextField(
        // This Input Decoration can be const as its layout doesn't change.
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Search...',
          hintStyle: const TextStyle(color: Color(0xffDDDADA), fontSize: 14),
          // Search Icon
          prefixIcon: const Padding(
            padding: EdgeInsets.all(12),
            // FIX: Added 'const' to Icon, as the icon itself is static.
            child: const Icon(Icons.search, color: Colors.grey),
          ),
          // Filter Icon and Divider
          suffixIcon: SizedBox(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Divider line
                Container(width: 1, height: 30, color: const Color(0xffDDDADA)),
                const Padding(
                  padding: EdgeInsets.all(12),
                  // FIX: Added 'const' to Icon.
                  child: const Icon(Icons.filter_list, color: Colors.grey),
                ),
              ],
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  // Builds the Categories section (Horizontal ListView).
  Column _categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Category',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 15),

        SizedBox(
          height: 120,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => const SizedBox(width: 25),
            itemBuilder: (context, index) {
              final category = categories[index];
              return Container(
                width: 100,
                decoration: BoxDecoration(
                  // Using withAlpha(128) for 0.5 opacity (no deprecated warnings)
                  color: category.boxColor.withAlpha(128),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Icon Circle
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          category.iconPath,
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                    // Name Text
                    Text(
                      category.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // Builds the Recommended Diets section (Horizontal ListView).
  Column _recommendedSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Recommendation\n for Diets',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 15),

        SizedBox(
          height: 240,
          child: ListView.separated(
            itemCount: diets.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => const SizedBox(width: 25),
            itemBuilder: (context, index) {
              final diet = diets[index];

              return Container(
                width: 210,
                decoration: BoxDecoration(
                  // Using withAlpha(76) for 0.3 opacity (no deprecated warnings)
                  color: diet.boxColor.withAlpha(76),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(diet.iconPath, height: 70, width: 70),

                    Text(
                      diet.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),

                    Text(
                      '${diet.level} | ${diet.duration} | ${diet.calories}',
                      style: const TextStyle(
                        color: Color(0xff7B6F72),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    // 'View' Button
                    Container(
                      height: 45,
                      width: 130,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            diet.viewIsSelected
                                ? const Color(0xff9DCEFF)
                                : Colors.transparent,
                            diet.viewIsSelected
                                ? const Color(0xff92A3FD)
                                : Colors.transparent,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          'View',
                          style: TextStyle(
                            color: diet.viewIsSelected
                                ? Colors.white
                                : const Color(0xffC58BF2),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // Builds the Popular Diets section (Vertical ListView).
  Column _popularSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Popular',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 15),

        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: ListView.separated(
            // Properties needed for nested ListViews.
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: popularDiets.length,
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            itemBuilder: (context, index) {
              final popular = popularDiets[index];

              return Container(
                height: 100,
                decoration: BoxDecoration(
                  // Using withAlpha(76) for 0.3 opacity (no deprecated warnings)
                  color: popular.boxColor.withAlpha(76),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      // Using withAlpha(18) for 0.07 opacity (no deprecated warnings)
                      color: const Color(0xff1D1617).withAlpha(18),
                      offset: const Offset(0, 10),
                      blurRadius: 40,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(popular.iconPath, width: 65, height: 65),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          popular.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '${popular.complexity} | ${popular.time}',
                          style: const TextStyle(
                            color: Color(0xff7B6F72),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),

                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/icons/arrow-right.svg',
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
