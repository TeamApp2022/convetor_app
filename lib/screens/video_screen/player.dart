import 'dart:async';
import 'dart:io';

import 'package:convertor_app/helpers/decoration.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';



class PlayerTab {
  void setController(VideoPlayerController controller) {}
}

class EmbeddedPlayer extends StatefulWidget {
  final String _filePath;
  final PlayerTab _playerTab;

  EmbeddedPlayer(this._filePath, this._playerTab);

  @override
  _EmbeddedPlayerState createState() =>
      _EmbeddedPlayerState(new File(_filePath), _playerTab);
}

class _EmbeddedPlayerState extends State<EmbeddedPlayer> {
  final PlayerTab _playerTab;
  final File _file;
  VideoPlayerController _videoPlayerController;
  bool startedPlaying = false;

  _EmbeddedPlayerState(this._file, this._playerTab);

  @override
  void initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.file(_file);
    _playerTab.setController(_videoPlayerController);
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 0,
        child: Center(
          child: FutureBuilder<bool>(
            future: Future.value(_videoPlayerController.value.isInitialized),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.data == true) {
                return Container(
                  alignment: Alignment(0.0, 0.0),
                  child: VideoPlayer(_videoPlayerController),
                );
              } else {
                return Container(
                  alignment: Alignment(0.0, 0.0),
                  decoration: videoPlayerFrameDecoration,
                );
              }
            },
          ),
        ));
  }
}
