import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

import 'login.dart';

var time = DateTime.now().hour;
var min = DateTime.now().minute;

var newTime = DateTime.now();
String formattedDate = DateFormat('kk:mm').format(newTime);

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

final firestoreInstance = FirebaseFirestore.instance;
AsyncSnapshot<DocumentSnapshot> snapshot;
Stream<QuerySnapshot> mainStream;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    mainStream = firestoreInstance.collection('mood').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    var _screenWidth = MediaQuery.of(context).size.width;
    var _width = (_screenWidth - 20) / 2;
    var _aspectRatio = _width / 250;
    return Scaffold(
      backgroundColor: HexColor('#FFE3F2'),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: HexColor('#FFE3F2'),
        elevation: 0,
        title: Text(greeting + ", $name",
            style: TextStyle(
                fontFamily: 'Gotham',
                fontSize: 20,
                color: HexColor('#7D7D7D'))),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.23,
                width: MediaQuery.of(context).size.width * 0.95,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      gradient: LinearGradient(
                          colors: [HexColor('#FF84AF'), HexColor('#CA82CC')])),
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
                              "Daily Motivation".toUpperCase(),
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
            Container(
              child: StreamBuilder(
                stream: mainStream,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  var totalgroupCount = 0;
                  List<DocumentSnapshot> groupUsers;
                  if (snapshot.hasData) {
                    groupUsers = snapshot.data.documents;
                    totalgroupCount = groupUsers.length;
                    return (Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: groupUsers.length,
                          itemBuilder: (context, int index) {
                            return SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Slidable(
                                  actionPane: SlidableDrawerActionPane(),
                                  actionExtentRatio: 0.25,
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              color: Colors.white,
                                            ),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.15,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                1,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Text(
                                                      groupUsers[index]
                                                          .data()['time']
                                                          .toString()
                                                          .toUpperCase(),
                                                      style: TextStyle(
                                                          fontFamily: 'Gotham',
                                                          fontSize: 16,
                                                          color: Colors.grey)),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Text(
                                                      groupUsers[index]
                                                          .data()['mood'],
                                                      style: TextStyle(
                                                          fontFamily: 'Gotham',
                                                          fontSize: 17,
                                                          color: HexColor(
                                                              '#000000'))),
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Text(
                                                      groupUsers[index]
                                                          .data()['newTime'],
                                                      style: TextStyle(
                                                          color: HexColor(
                                                              '#A8617A'),
                                                          fontFamily: 'Gotham'),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ],
                                    ),
                                  ),
                                  secondaryActions: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          color: HexColor('#FF0D0D'),
                                        ),
                                        child: Container(
                                          child: IconButton(
                                            icon: Icon(Icons.delete,
                                                color: Colors.white),
                                            onPressed: () {
                                              print("Delete triggered");
                                              firestoreInstance
                                                  .collection('mood')
                                                  .doc(groupUsers[index]
                                                      .data()['id'])
                                                  .delete()
                                                  .then((_) {
                                                print("success!");
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ));
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
