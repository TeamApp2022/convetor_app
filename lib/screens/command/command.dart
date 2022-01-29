import 'package:convertor_app/constants/constants.dart';
import 'package:convertor_app/helpers/decoration.dart';
import 'package:flutter/material.dart';




class CommandScreen extends StatefulWidget {
  @override
  _CommandScreenState createState() => _CommandScreenState();
}

class _CommandScreenState extends State<CommandScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 40),
          child: TextField(
            controller: commandTab.getCommandText(),
            decoration: inputDecoration('Enter command'),
            style: textFieldStyle,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 20),
          child: new InkWell(
            onTap: () => commandTab.runFFmpeg(),
            child: new Container(
              width: 130,
              height: 38,
              decoration: buttonDecoration,
              child: new Center(
                child: new Text(
                  'RUN FFMPEG',
                  style: buttonTextStyle,
                ),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 20),
          child: new InkWell(
            onTap: () => commandTab.runFFprobe(),
            child: new Container(
              width: 130,
              height: 38,
              decoration: buttonDecoration,
              child: new Center(
                child: new Text(
                  'RUN FFPROBE',
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
                  reverse: true, child: Text(commandTab.getOutputText()))),
        )
      ],
    );
  }
}
