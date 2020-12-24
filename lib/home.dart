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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.23,
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                gradient: LinearGradient(colors: [
                                  HexColor('#FF84AF'),
                                  HexColor('#CA82CC')
                                ])),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Icon(
                                    Icons.thumb_up_outlined,
                                    color: HexColor('#7D7D7D'),
                                  ),
                                ),
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
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    "All our dreams can come true, if we have the courage to pursue them. – Walt Disney.",
                                    style: TextStyle(
                                        fontFamily: 'Gotham',
                                        color: HexColor('#A8617A'),
                                        fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
