import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'blog.dart';

final voiceController = TextEditingController();

class Voice extends StatefulWidget {
  @override
  _VoiceState createState() => _VoiceState();
}

class _VoiceState extends State<Voice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  newDate.toUpperCase(),
                  style: TextStyle(
                      fontFamily: 'Gotham',
                      color: HexColor('#A8617A'),
                      fontSize: 16),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Voice Note",
                    style: TextStyle(
                        fontFamily: 'Gotham',
                        fontSize: 30,
                        color: HexColor('#FE6EA0')),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "What's on your mind?".toUpperCase(),
                  style: TextStyle(
                      fontFamily: 'Gotham',
                      fontSize: 20,
                      color: HexColor('#FFFFFF')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 20, 10, 10),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: HexColor('#DC7196'),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: TextFormField(
                        controller: voiceController,
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
                          hintText: 'I\'ll note down everything you say.',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    child: IconButton(
                        icon: Icon(
                          Icons.multitrack_audio,
                          size: 30,
                          color: HexColor('#A8617A'),
                        ),
                        onPressed: () {
                          print("record pressed");
                        }),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
