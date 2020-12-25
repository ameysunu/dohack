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
          backgroundColor: HexColor('#E8DFF1'),
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
                  new Icon(Icons.multitrack_audio, color: HexColor('#5C6178')),
              title: new Text(
                'Graph',
                style:
                    TextStyle(color: HexColor('#5C6178'), fontFamily: 'Gotham'),
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.mood, color: HexColor('#5C6178')),
              title: new Text(
                'Mood',
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
          backgroundColor: HexColor('#FF84AF'),
          onPressed: () {
            _popup(context);
          },
          child: Icon(Icons.add)),
    );
  }
}

void _popup(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: HexColor('#FFE3F2'),
            ),
            height: MediaQuery.of(context).size.height * 0.25,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Daily blog",
                            style: TextStyle(
                                color: HexColor('#A8617A'),
                                fontFamily: 'Gotham',
                                fontSize: 20),
                          ),
                          Icon(
                            Icons.edit,
                            size: 20,
                            color: HexColor('#A8617A'),
                          )
                        ],
                      ),
                      onTap: () {
                        print("Daily Blog tapped");
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add a voicenote",
                          style: TextStyle(
                              color: HexColor('#A8617A'),
                              fontFamily: 'Gotham',
                              fontSize: 20),
                        ),
                        Icon(
                          Icons.mic,
                          color: HexColor('#A8617A'),
                        )
                      ],
                    ),
                    onTap: () {
                      print("Voicenote tapped");
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Enter mood",
                          style: TextStyle(
                              color: HexColor('#A8617A'),
                              fontFamily: 'Gotham',
                              fontSize: 20),
                        ),
                        Icon(
                          Icons.mood,
                          color: HexColor('#A8617A'),
                        )
                      ],
                    ),
                    onTap: () {
                      print("Seminar tapped");
                    },
                  ),
                ),
              ],
            ),
          ),
          contentPadding: EdgeInsets.all(0.0),
        );
      });
}
