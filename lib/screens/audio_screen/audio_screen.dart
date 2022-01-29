import 'package:convertor_app/constants/constants.dart';
import 'package:convertor_app/helpers/decoration.dart';
import 'package:flutter/material.dart';




class AudioScreen extends StatefulWidget {
  @override
  _AudioScreenState createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  @override
  initState() {
    super.initState();
  }

// AUDIO TAB COMPONENTS

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: Container(
              width: 200,
              alignment: Alignment.center,
              decoration: dropdownButtonDecoration,
              child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                style: dropdownButtonTextStyle,
                value: audioTab.getSelectedCodec(),
                items: audioTab.getAudioCodecList(),
                onChanged: audioTab.changedAudioCodec,
                iconSize: 0,
                isExpanded: false,
              )),
            )),
        Container(
          padding: const EdgeInsets.only(bottom: 20),
          child: new InkWell(
            onTap: () => audioTab.encodeAudio(),
            child: new Container(
              width: 100,
              height: 38,
              decoration: buttonDecoration,
              child: new Center(
                child: new Text(
                  'ENCODE',
                  style: buttonTextStyle,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
              alignment: Alignment(-1.0, -1.0),
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(4.0),
              decoration: outputDecoration,
              child: SingleChildScrollView(
                  reverse: true, child: Text(audioTab.getOutputText()))),
        ),
      ],
    );
  }
}
