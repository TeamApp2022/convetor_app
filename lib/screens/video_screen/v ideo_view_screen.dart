import 'dart:io';

import 'package:convertor_app/constants/constants.dart';
import 'package:convertor_app/helpers/decoration.dart';
import 'package:convertor_app/screens/video_screen/player.dart';
import 'package:flutter/material.dart';




class VideoView extends StatefulWidget {
  @override
  _VideoViewState createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
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
                value: videoTab.getSelectedCodec(),
                items: videoTab.getVideoCodecList(),
                onChanged: videoTab.changedVideoCodec,
                iconSize: 0,
                isExpanded: false,
              )),
            )),
        Container(
          padding: const EdgeInsets.only(bottom: 20),
          child: new InkWell(
            onTap: () => videoTab.encodeVideo(),
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
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(4.0),
            child: FutureBuilder(
              future: videoTab.getVideoFile(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  File file = snapshot.data as File;
                  return Container(
                      alignment: Alignment(0.0, 0.0),
                      child:
                          EmbeddedPlayer("${file.path.toString()}", videoTab));
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
