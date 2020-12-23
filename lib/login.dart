import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#FF84AF'),
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Alleviate",
                  style: TextStyle(
                      fontFamily: 'Gotham', fontSize: 25, color: Colors.white),
                ),
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Your personal journal and blog :)",
                      style: TextStyle(
                          fontFamily: 'Gotham',
                          fontSize: 20,
                          color: HexColor('#A8617A'))),
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
                        print("Red light");
                      },
                      color: Colors.white,
                      textColor: HexColor('#FF84AF'),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text("Get Started".toUpperCase(),
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
