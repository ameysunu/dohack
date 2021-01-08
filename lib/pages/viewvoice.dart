import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hexcolor/hexcolor.dart';

final firestoreInstance = FirebaseFirestore.instance;
AsyncSnapshot<DocumentSnapshot> snapshot;
Stream<QuerySnapshot> newStream;

class ViewVoice extends StatefulWidget {
  @override
  _ViewVoiceState createState() => _ViewVoiceState();
}

class _ViewVoiceState extends State<ViewVoice> {
  @override
  void initState() {
    super.initState();
    newStream = firestoreInstance.collection('voice').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    var _screenWidth = MediaQuery.of(context).size.width;
    var _width = (_screenWidth - 20) / 2;
    var _aspectRatio = _width / 250;
    return Scaffold(
      backgroundColor: HexColor('#CA82CC'),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: HexColor('#CA82CC'),
        elevation: 0,
        title: Text(
          'Voice Notes'.toUpperCase(),
          style: TextStyle(fontFamily: "Gotham", color: HexColor('#FFE7FF')),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.cancel,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
      body: Container(
        child: Container(
          child: StreamBuilder(
            stream: newStream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              var totalgroupCount = 0;
              List<DocumentSnapshot> groupUsers;
              if (snapshot.hasData) {
                groupUsers = snapshot.data.documents;
                totalgroupCount = groupUsers.length;
                return (Container(
                  child: ListView.builder(
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
                                            color: HexColor('#FF949B')),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.175,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text(
                                                  groupUsers[index]
                                                      .data()['time']
                                                      .toString()
                                                      .toUpperCase(),
                                                  style: TextStyle(
                                                      fontFamily: 'Gotham',
                                                      fontSize: 16,
                                                      color: Colors.white)),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text(
                                                  groupUsers[index]
                                                      .data()['voice'],
                                                  style: TextStyle(
                                                      fontFamily: 'Gotham',
                                                      fontSize: 15,
                                                      color:
                                                          HexColor('#726993'))),
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
                                      borderRadius: BorderRadius.circular(15.0),
                                      color: HexColor('#FF0D0D'),
                                    ),
                                    child: Container(
                                      child: IconButton(
                                        icon: Icon(Icons.delete,
                                            color: Colors.white),
                                        onPressed: () {
                                          print("Delete triggered");
                                          firestoreInstance
                                              .collection('voice')
                                              .doc(groupUsers[index]
                                                  .data()['id'])
                                              .delete()
                                              .then((_) {
                                            print("success!");
                                          });
                                        },
                                      ),
                                    ),
                                    // child: IconSlideAction(
                                    //   caption: 'Edit',
                                    //   icon: Icons.edit,
                                    //   onTap: () => print("more"),
                                    // ),
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
      ),
    );
  }
}
