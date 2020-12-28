import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../login.dart';

class Mood extends StatefulWidget {
  @override
  _MoodState createState() => _MoodState();
}

class _MoodState extends State<Mood> {
  String dropdownValue = 'Neutral 😶';
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
          child: Container(
            child: Column(
              children: [
                Center(
                    child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Hey $name, How are you doing?",
                    style: TextStyle(
                        fontFamily: 'Gotham',
                        color: Colors.white,
                        fontSize: 20),
                  ),
                )),
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    color: HexColor('#CA82CC'),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        canvasColor: HexColor('#CA82CC'),
                      ),
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            iconSize: 0,
                            elevation: 16,
                            style: TextStyle(color: Colors.white),
                            underline: Container(
                              height: 0,
                              color: Colors.white,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                              });
                            },
                            items: <String>[
                              'Neutral 😶',
                              'Awesome  😁 ',
                              'Really good  😄 ',
                              'Fine 😀 ',
                              'Bad 🥺',
                              'Terrible  😩 ',
                              'Sad  😭 '
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(value.toUpperCase(),
                                      style: TextStyle(
                                          fontFamily: 'Gotham',
                                          color: Colors.white,
                                          fontSize: 20)),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
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
