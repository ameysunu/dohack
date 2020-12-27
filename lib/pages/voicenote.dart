import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'blog.dart';

class Voice extends StatefulWidget {
  @override
  _VoiceState createState() => _VoiceState();
}

class _VoiceState extends State<Voice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#FF84AF'),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: HexColor('#FF84AF'),
        actions: [
          IconButton(
              icon: Icon(
                Icons.cancel,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  newDate.toUpperCase(),
                  style: TextStyle(
                      fontFamily: 'Gotham',
                      color: HexColor('#A8617A'),
                      fontSize: 16),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Voice Note",
                    style: TextStyle(
                        fontFamily: 'Gotham',
                        fontSize: 30,
                        color: HexColor('#FE6EA0')),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "What's on your mind?".toUpperCase(),
                  style: TextStyle(
                      fontFamily: 'Gotham',
                      fontSize: 20,
                      color: HexColor('#FFFFFF')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
