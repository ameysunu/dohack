import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'login.dart';
import 'quotes.dart' as quotes;
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

var time = DateTime.now().hour;

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

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor('#FFE3F2'),
        body: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(greeting + ", $name",
                      style: TextStyle(
                          fontFamily: 'Gotham',
                          fontSize: 20,
                          color: HexColor('#7D7D7D'))),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.23,
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                gradient: LinearGradient(colors: [
                                  HexColor('#FF84AF'),
                                  HexColor('#CA82CC')
                                ])),
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
                      Padding(
                        padding: const EdgeInsets.all(10.0),
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
                                    Icons.lock_clock,
                                    color: HexColor('#7D7D7D'),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        "Reminder".toUpperCase(),
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
                                    "Be reminded of all important things for the day.",
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
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      "25 December 2020".toUpperCase(),
                                      style: TextStyle(
                                          fontFamily: 'Gotham',
                                          color: Colors.grey,
                                          fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Feeling awesome",
                                  style: TextStyle(
                                      fontFamily: 'Gotham',
                                      color: Colors.black,
                                      fontSize: 15),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      formattedDate,
                                      style: TextStyle(
                                        fontFamily: 'Gotham',
                                        color: HexColor('#A8617A'),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Icon(
                                        Icons.mood,
                                        color: HexColor('#A8617A'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    secondaryActions: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: HexColor('#BEA6A0'),
                          ),
                          child: Container(
                            child: IconButton(
                              icon: Icon(Icons.edit, color: Colors.white),
                              onPressed: () {
                                print("Edit triggered");
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
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: HexColor('#FF0D0D'),
                          ),
                          child: Container(
                            child: IconButton(
                              icon: Icon(Icons.delete, color: Colors.white),
                              onPressed: () {
                                print("Delete triggered");
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
                )
              ],
            ),
          ),
        ));
  }
}
