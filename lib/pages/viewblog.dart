import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:share/share.dart';

final firestoreInstance = FirebaseFirestore.instance;
AsyncSnapshot<DocumentSnapshot> snapshot;
Stream<QuerySnapshot> newStream;

class ViewBlog extends StatefulWidget {
  @override
  _ViewBlogState createState() => _ViewBlogState();
}

class _ViewBlogState extends State<ViewBlog> {
  @override
  void initState() {
    super.initState();
    newStream = firestoreInstance.collection('blog').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    var _screenWidth = MediaQuery.of(context).size.width;
    var _width = (_screenWidth - 20) / 2;
    var _aspectRatio = _width / 250;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Blogs'.toUpperCase(),
          style: TextStyle(fontFamily: "Gotham", color: HexColor('#FF84AF')),
        ),
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
                            child: Container(
                              child: Column(
                                children: [
                                  InkWell(
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            gradient: LinearGradient(colors: [
                                              HexColor('#FFA583'),
                                              HexColor('#EAD74F')
                                            ])),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.2,
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
                                              child: Icon(
                                                Icons.book,
                                                color: HexColor('#7D7D7D'),
                                              ),
                                            ),
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
                                                      .data()['title'],
                                                  style: TextStyle(
                                                      fontFamily: 'Gotham',
                                                      fontSize: 20,
                                                      color:
                                                          HexColor('#A8617A'))),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: InkWell(
                                                    child: Icon(Icons.delete,
                                                        color: Colors.red),
                                                    onTap: () {
                                                      null;
                                                    }),
                                              ),
                                            ),
                                          ],
                                        )),
                                    onTap: () {
                                      print("tapped");
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetailsPage(
                                                  title: groupUsers[index]
                                                      .data()['title'],
                                                  body: groupUsers[index]
                                                      .data()['body'],
                                                  date: groupUsers[index]
                                                      .data()['time'])));
                                    },
                                  ),
                                ],
                              ),
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

class DetailsPage extends StatelessWidget {
  final String title, body, date;
  const DetailsPage({Key key, this.title, this.body, this.date})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#FF84AF'),
      appBar: AppBar(
        backgroundColor: HexColor('#FF84AF'),
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                        child: Text(
                      date.toUpperCase(),
                      style: TextStyle(
                          fontFamily: 'Gotham',
                          fontSize: 17,
                          color: Colors.white),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      title,
                      style: TextStyle(
                          fontFamily: 'Gotham',
                          fontSize: 30,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      body,
                      style: TextStyle(
                          fontFamily: 'Gotham',
                          fontSize: 20,
                          color: HexColor('#A8617A')),
                    ),
                  )
                ],
              ),
            ),
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10, 10, 20),
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: HexColor('#A8617A'),
                        ),
                        onPressed: () {
                          null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.share,
                          color: HexColor('#A8617A'),
                        ),
                        onPressed: () {
                          Share.share('Check out my Blog',
                              subject: 'Here\'s my blog');
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.copy,
                          color: HexColor('#A8617A'),
                        ),
                        onPressed: () {
                          Clipboard.setData(new ClipboardData(text: body));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: HexColor('#7E85D5'),
      //   child: Icon(Icons.edit),
      //   onPressed: () {
      //     print("Edit triggered");
      //   },
      // ),
    );
  }
}
