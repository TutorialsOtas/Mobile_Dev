import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'KudiBaabu',
          style: TextStyle(
            color: Colors.yellow,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 4,
        leading: Container(
          margin: EdgeInsets.all(8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
          ),
          child: SvgPicture.asset(
            'assets/icons/arrow.svg',
            // ignore: deprecated_member_use
            color: Colors.white,
          ),
        ),
        actions: [
          Container(
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
        ],
      ),
    );
  }
}
