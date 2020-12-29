import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Week extends StatefulWidget {
  @override
  _WeekState createState() => _WeekState();
}

class _WeekState extends State<Week> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#CA82CC'),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Avicii".toUpperCase(),
                      style: TextStyle(
                          fontFamily: 'Gotham',
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
