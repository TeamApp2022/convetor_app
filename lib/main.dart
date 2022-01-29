import 'package:convertor_app/abstract/abstract.dart';
import 'package:convertor_app/constants/constants.dart';
import 'package:convertor_app/contols/flutter_ffmpeg_api_wrapper.dart';
import 'package:convertor_app/helpers/decoration.dart';
import 'package:convertor_app/helpers/video_util.dart';
import 'package:convertor_app/models/progress_modal.dart';
import 'package:convertor_app/screens/audio_screen/audio_screen.dart';
import 'package:convertor_app/screens/command/command.dart';
import 'package:convertor_app/screens/concurrent_excution/concurrent_excution.dart';
import 'package:convertor_app/screens/http/http_screen.dart';
import 'package:convertor_app/screens/pipe/pipe_screen.dart';
import 'package:convertor_app/screens/vid_stab/vid_stab.dart';
import 'package:convertor_app/screens/video_screen/sub_title/subtitle_main.dart';
import 'package:convertor_app/screens/video_screen/v%20ideo_view_screen.dart';
import 'package:convertor_app/test_api/test_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ffmpeg/log_level.dart';



GlobalKey _globalKey = GlobalKey();

void main() => runApp(FlutterFFmpegExampleApp());

class FlutterFFmpegExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appThemeData,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  FlutterFFmpegExampleAppState createState() =>
      new FlutterFFmpegExampleAppState();
}

class DecoratedTabBar extends StatelessWidget implements PreferredSizeWidget {
  DecoratedTabBar({@required this.tabBar, @required this.decoration});

  final TabBar tabBar;
  final BoxDecoration decoration;

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Container(decoration: decoration)),
        tabBar,
      ],
    );
  }
}

class FlutterFFmpegExampleAppState extends State<MainPage>
    with TickerProviderStateMixin
    implements RefreshablePlayerDialogFactory {
  // COMMON COMPONENTS
   TabController _controller;

  // CONCURRENT EXECUTION TAB COMPONENTS

  void refresh() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    commandTab.init(this);
    videoTab.init(this);
    audioTab.init(this);
    subtitleTab.init(this);
    httpsTab.init(this);
    vidStabTab.init(this);
    pipeTab.init(this);
    concurrentExecutionTab.init(this);
    _controller = TabController(length: 8, vsync: this);
    _controller.addListener(() {
      if (_controller.indexIsChanging) {
        switch (_controller.index) {
          case 0:
            commandTab.setActive();
            break;
          case 1:
            videoTab.setActive();
            break;
          case 2:
            httpsTab.setActive();
            break;
          case 3:
            audioTab.setActive();
            break;
          case 4:
            subtitleTab.setActive();
            break;
          case 5:
            vidStabTab.setActive();
            break;
          case 6:
            pipeTab.setActive();
            break;
          case 7:
            concurrentExecutionTab.setActive();
            break;
        }
      }
    });
    Test.testCommonApiMethods();
    Test.testParseArguments();
    VideoUtil.prepareAssets();
    VideoUtil.registerAppFont();
    setLogLevel(LogLevel.AV_LOG_INFO);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        appBar: AppBar(
          title: Text('FlutterFFmpegTest'),
          centerTitle: true,
        ),
        bottomNavigationBar: Material(
          child: DecoratedTabBar(
            tabBar: TabBar(
              isScrollable: true,
              tabs: <Tab>[
                Tab(text: "COMMAND"),
                Tab(text: "VIDEO"),
                Tab(text: "HTTPS"),
                Tab(text: "AUDIO"),
                Tab(text: "SUBTITLE"),
                Tab(text: "VID.STAB"),
                Tab(text: "PIPE"),
                Tab(text: "CONCURRENT EXECUTION")
              ],
              controller: _controller,
              labelColor: selectedTabColor,
              unselectedLabelColor: unSelectedTabColor,
            ),
            decoration: tabBarDecoration,
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CommandScreen(),
            VideoView(),
            HttpScreen(),
            AudioScreen(),
            SubTitleMain(),
            VideoStab(),
            PipeScreen(),
            ConcurrentExcution()
          ],
          controller: _controller,
        ));
  }

  @override
  void dialogHide() {
    if (progressModal != null) {
      progressModal?.hide();
    }
  }

  @override
  void dialogShowCancellable(String message, Function cancelFunction) {
    progressModal = new ProgressModal(_globalKey.currentContext);
    progressModal?.show(message, cancelFunction: cancelFunction);
  }

  @override
  void dialogShow(String message) {
    progressModal = new ProgressModal(_globalKey.currentContext);
    progressModal?.show(message);
  }

  @override
  void dialogUpdate(String message) {
    progressModal?.update(message: message);
  }

  @override
  void dispose() {
    commandTab.dispose();
    super.dispose();
  }
}
