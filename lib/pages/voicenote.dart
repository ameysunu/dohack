import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_speech/google_speech.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sound_stream/sound_stream.dart';
import 'blog.dart';

final voiceController = TextEditingController();
String hint = "I'll note down everything you say.";

class Voice extends StatefulWidget {
  @override
  _VoiceState createState() => _VoiceState();
}

class _VoiceState extends State<Voice> {
  bool recognizing = false;
  bool recognizeFinished = false;
  String text = '';
  static final _users = <int>[];
  final _infoStrings = <String>[];
  bool muted = false;

  final RecorderStream _recorder = RecorderStream();

  @override
  void initState() {
    super.initState();
    _recorder.initialize();
  }

  void streamingRecognize() async {
    await _recorder.start();

    setState(() {
      recognizing = true;
    });
    final serviceAccount = ServiceAccount.fromString(
        '${(await rootBundle.loadString('assets/test_service_account.json'))}');
    final speechToText = SpeechToText.viaServiceAccount(serviceAccount);
    final config = _getConfig();

    final responseStream = speechToText.streamingRecognize(
        StreamingRecognitionConfig(config: config, interimResults: true),
        _recorder.audioStream);

    responseStream.listen((data) {
      setState(() {
        text =
            data.results.map((e) => e.alternatives.first.transcript).join('\n');
        recognizeFinished = true;
      });
    }, onDone: () {
      setState(() {
        recognizing = false;
      });
    });
  }

  void stopRecording() async {
    await _recorder.stop();
    setState(() {
      recognizing = false;
    });
  }

  RecognitionConfig _getConfig() => RecognitionConfig(
      encoding: AudioEncoding.LINEAR16,
      model: RecognitionModel.basic,
      enableAutomaticPunctuation: true,
      sampleRateHertz: 16000,
      languageCode: 'en-US');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
              if (recognizeFinished)
                _RecognizeContent(
                  text: text,
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
                      icon: recognizing
                          ? Icon(
                              Icons.stop,
                              size: 30,
                              color: HexColor('#A8617A'),
                            )
                          : Icon(
                              Icons.multitrack_audio,
                              size: 30,
                              color: HexColor('#A8617A'),
                            ),
                      onPressed:
                          recognizing ? stopRecording : streamingRecognize,
                    ),
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

class _RecognizeContent extends StatelessWidget {
  final String text;

  const _RecognizeContent({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                  enabled: false,
                  controller: voiceController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: TextStyle(color: Colors.white, fontFamily: 'Gotham'),
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
                    labelStyle:
                        TextStyle(fontFamily: 'Gotham', color: Colors.white),
                    hintText: text,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ButtonTheme(
            height: 50,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: HexColor('#FF84AF'))),
              onPressed: () {
                newVoice();
                print("done");
                Navigator.pop(context);
              },
              color: Colors.white,
              textColor: HexColor('#FF84AF'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text("Done".toUpperCase(),
                        style: TextStyle(fontFamily: 'Gotham')),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

void newVoice() async {
  firestoreInstance
      .collection('blog')
      .doc('voicenote')
      .collection('voice')
      .doc('${now.day}${now.month}${now.year}')
      .set({
    "voice": _RecognizeContent().text,
    "time": "$newDate",
  }).then((_) {
    print("success!");
  });
}

void clear() {
  voiceController.clear();
}
