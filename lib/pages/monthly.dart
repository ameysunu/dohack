import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Month extends StatefulWidget {
  @override
  _MonthState createState() => _MonthState();
}

class ClicksPerYear {
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
      : this.color = new charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

class _MonthState extends State<Month> {
  @override
  Widget build(BuildContext context) {
    var data = [
      ClicksPerYear('Good Days', 35, HexColor('#FD85B8')),
      ClicksPerYear('Bad Days', 25, HexColor('#FD85B8')),
      ClicksPerYear('Null', 10, HexColor('#FD85B8')),
    ];

    var series = [
      charts.Series(
        domainFn: (ClicksPerYear clickData, _) => clickData.year,
        measureFn: (ClicksPerYear clickData, _) => clickData.clicks,
        colorFn: (ClicksPerYear clickData, _) => clickData.color,
        id: 'Clicks',
        data: data,
      ),
    ];

    var chart = charts.BarChart(
      series,
      animate: true,
    );

    var chartWidget = Padding(
      padding: EdgeInsets.all(32.0),
      child: SizedBox(
        height: 200.0,
        child: chart,
      ),
    );

    return Scaffold(
      backgroundColor: HexColor('#CA82CC'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "January",
                    style: TextStyle(
                        fontFamily: 'Gotham',
                        color: Colors.white,
                        fontSize: 20),
                  ),
                ),
                chartWidget,
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
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
                                "Monthly Analysis".toUpperCase(),
                                style: TextStyle(
                                    fontFamily: 'Gotham', fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Blogged very less".toUpperCase(),
                            style: TextStyle(
                                fontFamily: 'Gotham',
                                fontSize: 15,
                                color: Colors.black54),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: HexColor('#FFE7FF'),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: Text(
                          "2",
                          style: TextStyle(fontFamily: 'Gotham', fontSize: 50),
                        )),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "blogged days".toLowerCase(),
                            style: TextStyle(
                                fontFamily: 'Gotham',
                                fontSize: 17,
                                color: Colors.black54),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.height * 1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: HexColor('#FF84AF'),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Summary".toUpperCase(),
                            style: TextStyle(
                                fontFamily: 'Gotham',
                                color: Colors.white,
                                fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "The user has had a good mood for most days.",
                            style: TextStyle(
                                fontFamily: 'Gotham',
                                color: Colors.white54,
                                fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
