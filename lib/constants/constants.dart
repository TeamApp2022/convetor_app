// AUDIO TAB COMPONENTS
import 'package:convertor_app/models/progress_modal.dart';
import 'package:convertor_app/screens/audio_screen/audio_tab.dart';
import 'package:convertor_app/screens/command/command_tab.dart';
import 'package:convertor_app/screens/concurrent_excution/concurrent_execution_tab.dart';
import 'package:convertor_app/screens/http/https_tab.dart';
import 'package:convertor_app/screens/pipe/pipe_tab.dart';
import 'package:convertor_app/screens/vid_stab/vid_stab_tab.dart';
import 'package:convertor_app/screens/video_screen/sub_title/subtitle_tab.dart';
import 'package:convertor_app/screens/video_screen/video_tab.dart';



AudioTab audioTab = new AudioTab();

// VIDEO TAB COMPONENTS
VideoTab videoTab = new VideoTab();

// SUBTITLE TAB COMPONENTS
SubtitleTab subtitleTab = new SubtitleTab();

ProgressModal progressModal;

// COMMAND TAB COMPONENTS
CommandTab commandTab = new CommandTab();

// HTTPS TAB COMPONENTS
HttpsTab httpsTab = new HttpsTab();

// VIDSTAB TAB COMPONENTS
VidStabTab vidStabTab = new VidStabTab();

// PIPE TAB COMPONENTS
PipeTab pipeTab = new PipeTab();

ConcurrentExecutionTab concurrentExecutionTab = new ConcurrentExecutionTab();
