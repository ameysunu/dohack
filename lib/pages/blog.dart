import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final titleController = TextEditingController();
final bodyController = TextEditingController();
final firestoreInstance = FirebaseFirestore.instance;

DateTime now = DateTime.now();
String newDate = DateFormat('EEE d MMM, kk:mm').format(now);

class Blog extends StatefulWidget {
  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Scaffold(
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
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                    child: Text(
                  newDate.toUpperCase(),
                  style: TextStyle(
                      fontFamily: 'Gotham', color: Colors.white, fontSize: 16),
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Daily Blog".toUpperCase(),
                  style: TextStyle(
                      fontFamily: 'Gotham', color: Colors.white, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: HexColor('#DC7196'),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: titleController,
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'Gotham'),
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
                        hintText: 'Title',
                      ),
                    ),
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
                        controller: bodyController,
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
                          hintText: 'Add your blog\'s body',
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
                        newRecord();
                        print("Swedish house mafia");
                        clear();
                        Navigator.pop(context);
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

void newRecord() async {
  firestoreInstance
      .collection('blog')
      .doc('${now.day}${now.month}${now.year}')
      .set({
    "title": titleController.text,
    "body": bodyController.text,
    "id": '${now.day}${now.month}${now.year}',
    "time": "$newDate",
  }).then((_) {
    print("success!");
  });
}

void clear() {
  titleController.clear();
  bodyController.clear();
}
