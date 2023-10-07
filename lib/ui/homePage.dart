import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'HomeScreen.dart';
import 'ProfileScreen.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0;

  final _pageOptions = [
    HomeScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Color.fromRGBO(238, 238, 238, 1),
        body: _pageOptions[selectedPage],
        bottomNavigationBar: CurvedNavigationBar(
          items: [
            Icon(Icons.home, size: 30),
            Icon(Icons.account_box_outlined, size: 30)
          ],
          buttonBackgroundColor: Color(0xFFCA9CE0),
          backgroundColor: Color.fromRGBO(238, 238, 238, 1),
          color:  Color(0xFFCA9CE0),
          index: selectedPage,
          height: 60,
          onTap: (index){
            setState(() {
              selectedPage = index;
            });
          },
        )
    );
  }
}