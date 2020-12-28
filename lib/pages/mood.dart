import 'package:dohack/homewidget.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'blog.dart';

String dropdownValue = 'Neutral 😶';
final descriptionController = TextEditingController();
final firestoreInstance = FirebaseFirestore.instance;

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
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset('images/back.png'),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
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
                Spacer(),
                Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ButtonTheme(
                      height: 50,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(color: HexColor('#FF84AF'))),
                        onPressed: () {
                          print("Cash Cash");
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) {
                                return MoodSecond();
                              },
                            ),
                          );
                        },
                        color: Colors.white,
                        textColor: HexColor('#FF84AF'),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text("Continue".toUpperCase(),
                                  style: TextStyle(fontFamily: 'Gotham')),
                            ),
                          ],
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

class MoodSecond extends StatefulWidget {
  @override
  _MoodSecondState createState() => _MoodSecondState();
}

class _MoodSecondState extends State<MoodSecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: HexColor('#FF84AF'),
      appBar: AppBar(
        automaticallyImplyLeading: true,
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
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Tell us, what's making your day feel ${dropdownValue.toLowerCase()}?",
                      style: TextStyle(
                          fontFamily: 'Gotham',
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Description".toUpperCase(),
                    style: TextStyle(
                        fontFamily: 'Gotham', color: HexColor('#A8617A')),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: HexColor('#DC7196'),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: TextFormField(
                        controller: descriptionController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'Gotham'),
                        decoration: new InputDecoration(
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintStyle: TextStyle(
                            fontFamily: 'Gotham',
                            color: Colors.black54,
                            fontSize: 15,
                          ),
                          labelStyle: TextStyle(
                              fontFamily: 'Gotham', color: Colors.white),
                          hintText: 'Summary in 100-120 words',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ButtonTheme(
                    height: 50,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: HexColor('#FF84AF'))),
                      onPressed: () {
                        newMood();
                        clear();
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) {
                              return HomeWidget();
                            },
                          ),
                        );
                      },
                      color: Colors.white,
                      textColor: HexColor('#FF84AF'),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text("Done".toUpperCase(),
                                style: TextStyle(fontFamily: 'Gotham')),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void newMood() async {
  firestoreInstance
      .collection('mood')
      .doc('${now.day}${now.month}${now.year}')
      .set({
    "mood": dropdownValue,
    "mood_summary": descriptionController.text,
    "time": "$newDate",
  }).then((_) {
    print("success!");
  });
}

void clear() {
  descriptionController.clear();
}
