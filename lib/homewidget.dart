import 'package:dohack/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    Home(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: HexColor('#FFDFCA'),
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon:
                  new Icon(Icons.dashboard_rounded, color: HexColor('#5C6178')),
              title: new Text(
                'Home',
                style:
                    TextStyle(color: HexColor('#5C6178'), fontFamily: 'Gotham'),
              ),
            ),
            BottomNavigationBarItem(
              icon:
                  new Icon(CupertinoIcons.waveform, color: HexColor('#5C6178')),
              title: new Text(
                'Home',
                style:
                    TextStyle(color: HexColor('#5C6178'), fontFamily: 'Gotham'),
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.support, color: HexColor('#5C6178')),
              title: new Text(
                'Home',
                style:
                    TextStyle(color: HexColor('#5C6178'), fontFamily: 'Gotham'),
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.person, color: HexColor('#5C6178')),
              title: new Text(
                'User',
                style:
                    TextStyle(color: HexColor('#5C6178'), fontFamily: 'Gotham'),
              ),
            ),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
      body: _widgetOptions.elementAt(_selectedIndex),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            null;
          },
          child: Icon(Icons.add)),
    );
  }
}
