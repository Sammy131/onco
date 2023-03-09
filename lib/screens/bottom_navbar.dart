import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/gridinfo.dart';
import 'package:flutter_complete_guide/screens/logout.dart';
import 'home_screen.dart';

class MyBottomNav extends StatefulWidget {
  @override
  MyBottomNavState createState() {
    return new MyBottomNavState();
  }
}

class MyBottomNavState extends State<MyBottomNav> {
  int _currentIndex = 0;

  _onTapItem(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _myBottomNavBar() {
    return BottomNavigationBar(
        currentIndex: _currentIndex,
        //fixedColor: Colors.orange,
        onTap: _onTapItem,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 20,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.orange),
          BottomNavigationBarItem(
              icon: Icon(Icons.source),
              label: 'Reference',
              backgroundColor: Colors.orange),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'Bookmark',
              backgroundColor: Colors.orange),
          BottomNavigationBarItem(
              icon: Icon(Icons.note),
              label: 'Notes',
              backgroundColor: Colors.orange),
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: 'Calculator',
              backgroundColor: Colors.orange),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle),
              label: 'Account',
              backgroundColor: Colors.orange),
        ],
        selectedLabelStyle: TextStyle(fontSize: 10));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomNavContents(
        index: _currentIndex,
      ),
      bottomNavigationBar: _myBottomNavBar(),
    );
  }
}

class BottomNavContents extends StatelessWidget {
  BottomNavContents({required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: navBarContents(index, context),
      ),
    );
  }

  Widget navBarContents(int index, BuildContext context) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return info();
      case 2:
        return info();
      case 3:
        return info();
      case 4:
        return info();
      case 5:
        return logout();
      default:
        return Container();
    }
  }
}
