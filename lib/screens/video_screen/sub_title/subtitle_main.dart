import 'dart:io';

import 'package:convertor_app/constants/constants.dart';
import 'package:convertor_app/helpers/decoration.dart';
import 'package:convertor_app/screens/video_screen/player.dart';
import 'package:flutter/material.dart';




class SubTitleMain extends StatefulWidget {
  @override
  _SubTitleMainState createState() => _SubTitleMainState();
}

class _SubTitleMainState extends State<SubTitleMain> {
  // SUBTITLE TAB COMPONENTS
  // SubtitleTab subtitleTab = new SubtitleTab();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(top: 80, bottom: 60),
          child: new InkWell(
            onTap: () => subtitleTab.burnSubtitles(),
            child: new Container(
              width: 180,
              height: 38,
              decoration: buttonDecoration,
              child: new Center(
                child: new Text(
                  'BURN SUBTITLES',
                  style: buttonTextStyle,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(4.0),
            child: FutureBuilder(
              future: subtitleTab.getVideoWithSubtitlesFile(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  File file = snapshot.data as File;
                  return Container(
                      alignment: Alignment(0.0, 0.0),
                      child: EmbeddedPlayer("${file.path}", subtitleTab));
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
