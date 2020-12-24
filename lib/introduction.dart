import 'package:dohack/homewidget.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'login.dart';

class Introduction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroductionPage(),
    );
  }
}

class IntroductionPage extends StatefulWidget {
  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => HomeWidget()),
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(
        fontSize: 19.0,
        fontFamily: 'Gotham',
        color: Color.fromRGBO(168, 97, 122, 1));
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w700,
          fontFamily: 'Gotham',
          color: Colors.white),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Color.fromRGBO(255, 132, 172, 1),
      imagePadding: EdgeInsets.zero,
    );
    return Scaffold(
      backgroundColor: HexColor('#FF84AF'),
      body: SafeArea(
        child: IntroductionScreen(
          key: introKey,
          pages: [
            PageViewModel(
              title: "Welcome to Alleviate",
              body: "We are glad, you are here $name!",
              image: _buildImage('mello'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Write journals and blogs.",
              body: "Shhh..These stay only with you.",
              image: _buildImage('book'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "It's always happy hour!",
              bodyWidget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("We are always here for you.", style: bodyStyle),
                ],
              ),
              image: _buildImage('happy'),
              decoration: pageDecoration,
            ),
          ],
          onDone: () => _onIntroEnd(context),
          showSkipButton: true,
          skipFlex: 0,
          nextFlex: 0,
          skip: const Text('Skip',
              style: TextStyle(fontFamily: 'Gotham', color: Colors.white)),
          next: Icon(
            Icons.arrow_forward,
            color: HexColor('#A8617A'),
          ),
          done: const Text('Done',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Gotham',
                  color: Colors.white)),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0),
            color: Color(0xFFFFFFFF),
            activeSize: Size(22.0, 10.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildImage(String assetName) {
  return Align(
      child: Image.asset('images/$assetName.png', width: 350.0),
      alignment: Alignment.bottomCenter);
}
