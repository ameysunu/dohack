import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'login.dart';
import 'quotes.dart' as quotes;

var time = DateTime.now().hour;

String greeting = greetings();

String greetings() {
  if (time < 12) {
    return 'Good Morning';
  }
  if (time < 17) {
    return 'Good Afternoon';
  }
  return 'Good Evening';
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor('#FFE3F2'),
        body: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(greeting + ", $name",
                      style: TextStyle(
                          fontFamily: 'Gotham',
                          fontSize: 20,
                          color: HexColor('#7D7D7D'))),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 1,
                    child: Card(
                      color: HexColor('#FF84AF'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Daily Motivation",
                                  style: TextStyle(
                                      fontFamily: 'Gotham',
                                      color: Colors.white,
                                      fontSize: 20),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
