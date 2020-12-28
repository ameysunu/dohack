import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Mood extends StatefulWidget {
  @override
  _MoodState createState() => _MoodState();
}

class _MoodState extends State<Mood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
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
          child: Container(),
        ));
  }
}
