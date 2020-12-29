import 'package:dohack/pages/monthly.dart';
import 'package:dohack/pages/weekly.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Statistics extends StatefulWidget {
  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Text(
                  "Weekly".toUpperCase(),
                  style: TextStyle(fontFamily: 'Gotham', color: Colors.white),
                ),
              ),
              Tab(
                icon: Text(
                  "Monthly".toUpperCase(),
                  style: TextStyle(fontFamily: 'Gotham', color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Week(),
            Month(),
          ],
        ),
      ),
    );
  }
}
