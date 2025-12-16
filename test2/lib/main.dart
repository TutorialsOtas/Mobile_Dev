import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // <--- The Theme is defined here
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        iconTheme: IconThemeData(
            color: Colors.red
        ),

        textTheme: TextTheme(
            displaySmall: TextStyle(
              color: Colors.red, // This should now be applied
              fontSize: 24, // Added for better visibility
            )
        ),

      ),

      title: 'Flutter Demo - Introduction',
      // Use a Builder to get a context that is under MaterialApp
      home: Builder(
          builder: (context) { // <--- This 'context' can see the theme
            return Scaffold(
              appBar: AppBar(
                leading: Icon(Icons.menu,),
                title: Text('Flutter Demo - Introduction',),
              ),

              body: Center(
                child: Text(
                  'Flutter Demo - Introduction',
                  style: Theme.of(context).textTheme.displaySmall, // Now this will work
                ),
              ),
            );
          }
      ),
    );
  }
}
