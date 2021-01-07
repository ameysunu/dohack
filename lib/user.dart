import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'login.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#FFE3F2'),
      appBar: AppBar(
        backgroundColor: HexColor('#FFE3F2'),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                        child: Image.network(
                      imageUrl,
                      width: 100,
                      height: 100,
                    )),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          name.toUpperCase(),
                          style: TextStyle(
                            fontFamily: 'Gotham',
                            fontSize: 25,
                            color: HexColor('#A8617A'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          email,
                          style: TextStyle(
                            fontFamily: 'Gotham',
                            fontSize: 17,
                            color: HexColor('#A8617A'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.width * 0.42,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(colors: [
                              HexColor('#FF84AF'),
                              HexColor('#CA82CC')
                            ])),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.book,
                                color: HexColor('#A8617A'),
                              ),
                              onPressed: () {
                                null;
                              },
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Live Blog",
                                style: TextStyle(
                                  fontFamily: 'Gotham',
                                  color: HexColor('#FFFFFF'),
                                  fontSize: 17,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.width * 0.42,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(colors: [
                              HexColor('#CA82CC'),
                              HexColor('#FF84AF')
                            ])),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.error,
                                color: HexColor('#A8617A'),
                              ),
                              onPressed: () {
                                null;
                              },
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Report an issue",
                                style: TextStyle(
                                  fontFamily: 'Gotham',
                                  color: HexColor('#FFFFFF'),
                                  fontSize: 17,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 10, 20, 10),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.23,
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        gradient: LinearGradient(colors: [
                          HexColor('#FFA583'),
                          HexColor('#EAD74F')
                        ])),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.compass_calibration,
                            color: HexColor('#7D7D7D'),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Developer".toUpperCase(),
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
                            "Meet the developers of Alleviate.",
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
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 10, 20, 10),
                  child: ButtonTheme(
                    height: 50,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: HexColor('#FF84AF'))),
                      onPressed: () {
                        signOutGoogle();
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) {
                              return Login();
                            },
                          ),
                        );

                        print("Signed Out.");
                      },
                      color: HexColor('#FF84AF'),
                      textColor: HexColor('#FFFFFF'),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text("Sign Out".toUpperCase(),
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
