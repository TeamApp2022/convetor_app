import 'dart:io';

import 'package:convertor_app/constants/constants.dart';
import 'package:convertor_app/helpers/decoration.dart';
import 'package:convertor_app/screens/video_screen/player.dart';
import 'package:flutter/material.dart';



class PipeScreen extends StatefulWidget {
  @override
  _PipeScreenState createState() => _PipeScreenState();
}

class _PipeScreenState extends State<PipeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(top: 20, bottom: 10),
          child: new InkWell(
            onTap: () => pipeTab.createVideo(),
            child: new Container(
              width: 180,
              height: 38,
              decoration: buttonDecoration,
              child: new Center(
                child: new Text(
                  'CREATE',
                  style: buttonTextStyle,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(4.0),
            child: FutureBuilder(
              future: pipeTab.getVideoFile(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  File file = snapshot.data as File;
                  return Container(
                      alignment: Alignment(0.0, 0.0),
                      child: EmbeddedPlayer("${file.path}", pipeTab));
                } else {
                  return Container(
                    alignment: Alignment(0.0, 0.0),
                    decoration: videoPlayerFrameDecoration,
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
