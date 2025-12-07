import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/models/category_model.dart';
import 'package:test/models/diet_model.dart';
import 'package:test/models/popular_model.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);


final List<CategoryModel> categories = [];
final List<DietModel> diets = [];
final List<PopularModel> popular = [];

  @override
  _HomePageState createState() => _HomePageState();
}

void _getDiets(){

  diets = DietModel.getDiets();

}

void _getInitialInfo() {

  categories = CategoryModel.getcategories();
  diets = DietModel.getDiets();
  popularDiets = PopularModel.getPopularDiets();

}


class _HomePageState extends State<HomePage> {
  

  @override
  void initState() {
    super.initState();
    categories.addAll(CategoryModel.getcategories());
  }

  Widget build(BuildContext context) {
    _getInitialInfo();

    return Scaffold(
      appBar: AppBar(
        title: Text(
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
          onTap: () {
            // Action when the back arrow is tapped
          },
          child: Container(
            margin: EdgeInsets.all(8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgPicture.asset(
              'assets/icons/arrow.svg',
              // ignore: deprecated_member_use
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              // Action when the 3 dots icon is tapped
            },
            child: Container(
              margin: EdgeInsets.all(8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              height: 40,
              width: 40,
              child: SvgPicture.asset(
                'assets/icons/3dots.svg',
                // ignore: deprecated_member_use
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _getcategoriesSection(),
                      SizedBox(width: 40),
                      Column( 
                        crossAxisAlignment: CrossAxisAlignment.start,
                        padding(
                            Padding(
                              padding:  const EdgeInsets.only(left: 12.0),),
                      ),
                          SizedBox(height: 15,),
                          Container(
                            children: ([
                          Text(
                            'Recommendation\n for Diets',
                            style: TextStyle(color: Colors.white),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                            color: Colors.blue,
                            height: 240,
                            child:ListView.ListView.separated(
                        itemBuilder: (context, index) {
                          return Container(
                            height: 40,
                            width: 100,
                            color:diets[index].boxColor.withOpacity(0.5 
                          )
                          BorderRadius:BorderRadius.circular(20),
                          }

                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            alignment: Alignment.center,
                            child: Text(
                              diets[index].name,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }, 
                        separatorBuilder: 
                        separatorBuilder, 
                        itemCount: diets.length),
                        ScrollDirection: Axis.horizontal,
                          )
                        ]),
                      )
                      Container(
                        height: 24,
                        width: 1,
                        color: Colors.grey,
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                      ),
                      Icon(Icons.filter_list),
                    ],
                  ),
                  border: body(),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Category',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            Container(
              height: 120,
              width: double.infinity,
              margin: EdgeInsets.all(8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListView.separated(
                ItemCount: categories.length,
                scrollDirection: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                padding: EdgeInsets.only(left: 16, right: 16),
                separatorBuilder: (context, index) => SizedBox(width: 25),
                itemBuilder:(context, index){
                  return Container(
                    height: 60,
                    width: 60,
                    decoration:BoxDecoration(
                      color: categories[index].boxColor.withOpacity(0.5),
                      //borderRadius: BorderRadius.circular(12),
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                          )
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                categories[index].iconPath,
                                height: 30,
                                width: 30,
                              ),
                              Text(
                                diets[index].name,
                                
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                            ],

                            Text(
                              diets[index].level + '|' + diets[index].duration + '|' + diets[index].calories,
                              style: TextStyle(
                                fontSize: 12, 
                                color: Colors.grey,
                                fontWeight: FontWeight.w500
                            )
                          ],    
                          
                          ),
child: Row(children: [
                          SvgPicture.asset(
                            PopularDiets[index].iconPath,
                            height: 30,
                            width: 30,
                          ),
                          column(Text:
                          
                            PopularDiets.[index].name,
                            style: TextStyle
                            color: Colors.white,
                            fontSize: 18,
                              fontWeight: FontWeight.w600,  )
                        ],)
                          container(
                            height: 45,
                            width: 130,
                            child:Center(
                              child: Text(
                                'view',
                                style: TextStyle(
                                  color: diets[index].viewIsSelected ? Colors.orange : Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                        
                                ),
                              ),
                            )
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                diets[index].viewIsSelected ? Colors.orange : Colors.blue,
                                diets[index].viewIsSelected ? Colors.orangeAccent : Colors.lightBlue,
                              ]
                              )

                            ),
                          ),
                          borderRadius: BorderRadius.circular(50),
                        
                        child: Padding(padding: 
                        
                        const EdgeInsets.all(12.0),
                        chiild: SvgPicture.asset(
                          categories[index].iconPath,
                          height: 30,
                          width: 30,
                        ),
                      
                        Text(
                          categories[index].name,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                      )
                    ),
                  );
                }
                scrollDirection: Axis.horizontal,
                padding:EdgeInsets.only(left: 20, right: 20),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    alignment: Alignment.center,
                    child: Text(
                      'category',
                      style: TextStyle(color: Colors.white),
                    ),

                    column(
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:Text(
                          'Popular',
                          style: TextStyle
                          color: Colors.white,
                          fontSize: 18,
                            fontWeight: FontWeight.w600,  )
                        )
                        )
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                    sizedBox(height: 15,),
                    ListView.separated(
                      itemCount: popularDiets.length,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => SizedBox(width: 25),
                      padding: EdgeInsets.only(left: 16, right: 16),
                      itemBuilder: (context, index) {
                        return Container(
                          height: 40,
                          //width: 100,
                          child: Row(children: [
                            SvgPicture.asset(
                              popular[index].iconPath,
                              height: 30,
                              width: 30,
                            ),
                          ],),
                          decoration: BoxDecoration(  
                          color: popular[index].boxColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        boxshadow: (
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 2),
                            blurRadius: 4,
                            spreadRadius: 1,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            alignment: Alignment.center,
                            child: Text(
                              popular[index].name,
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                      
                      separatorBuilder: (context, index) => SizedBox(width: 12),
                      itemCount: popular.length,
                      scrollDirection: Axis.horizontal,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder body() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide.none,
    );
  }
}
