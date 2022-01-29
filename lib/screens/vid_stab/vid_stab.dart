import 'dart:io';

import 'package:convertor_app/constants/constants.dart';
import 'package:convertor_app/helpers/decoration.dart';
import 'package:convertor_app/screens/video_screen/player.dart';
import 'package:flutter/material.dart';



class VideoStab extends StatefulWidget {
  @override
  _VideoStabState createState() => _VideoStabState();
}

class _VideoStabState extends State<VideoStab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(4.0),
            child: FutureBuilder(
              future: vidStabTab.getVideoFile(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  File file = snapshot.data as File;
                  return Container(
                      alignment: Alignment(0.0, 0.0),
                      child: EmbeddedPlayer(
                          "${file.path}", vidStabTab.videoController));
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
        Container(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: new InkWell(
            onTap: () => vidStabTab.stabilizeVideo(),
            child: new Container(
              width: 180,
              height: 38,
              decoration: buttonDecoration,
              child: new Center(
                child: new Text(
                  'STABILIZE VIDEO',
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
              future: vidStabTab.getStabilizedVideoFile(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  File file = snapshot.data as File;
                  return Container(
                      alignment: Alignment(0.0, 0.0),
                      child: EmbeddedPlayer("${file.path}",
                          vidStabTab.stabilizedVideoController));
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
