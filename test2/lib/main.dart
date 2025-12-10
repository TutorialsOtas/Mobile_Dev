import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // <--- Opened 1
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      title: 'Flutter Demo - Introduction',
      home: Scaffold( // <--- Opened 2
        appBar: AppBar(
          title: Text('Flutter Demo - Introduction'),
        ),
        body: Center(
            child: Text('this is a starter. a skeleton to show that we have began the journey from lesson 1.')
        ),
      ),
    ); 
  }
}