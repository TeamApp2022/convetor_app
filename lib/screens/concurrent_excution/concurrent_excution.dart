import 'package:convertor_app/constants/constants.dart';
import 'package:convertor_app/helpers/decoration.dart';
import 'package:flutter/material.dart';



class ConcurrentExcution extends StatefulWidget {
  const ConcurrentExcution({Key key}) : super(key: key);

  @override
  _ConcurrentExcutionState createState() => _ConcurrentExcutionState();
}

class _ConcurrentExcutionState extends State<ConcurrentExcution> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: new InkWell(
                onTap: () => concurrentExecutionTab.encodeVideo(1),
                child: new Container(
                  width: 64,
                  height: 38,
                  decoration: buttonDecoration,
                  child: new Center(
                    child: new Text(
                      'ENCODE 1',
                      style: buttonSmallTextStyle,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: new InkWell(
                onTap: () => concurrentExecutionTab.encodeVideo(2),
                child: new Container(
                  width: 64,
                  height: 38,
                  decoration: buttonDecoration,
                  child: new Center(
                    child: new Text(
                      'ENCODE 2',
                      style: buttonSmallTextStyle,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: new InkWell(
                onTap: () => concurrentExecutionTab.encodeVideo(3),
                child: new Container(
                  width: 64,
                  height: 38,
                  decoration: buttonDecoration,
                  child: new Center(
                    child: new Text(
                      'ENCODE 3',
                      style: buttonSmallTextStyle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: new InkWell(
                onTap: () => concurrentExecutionTab.runCancel(1),
                child: new Container(
                  width: 62,
                  height: 38,
                  decoration: buttonDecoration,
                  child: new Center(
                    child: new Text(
                      'CANCEL 1',
                      style: buttonSmallTextStyle,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 10),
              child: new InkWell(
                onTap: () => concurrentExecutionTab.runCancel(2),
                child: new Container(
                  width: 62,
                  height: 38,
                  decoration: buttonDecoration,
                  child: new Center(
                    child: new Text(
                      'CANCEL 2',
                      style: buttonSmallTextStyle,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: new InkWell(
                onTap: () => concurrentExecutionTab.runCancel(3),
                child: new Container(
                  width: 62,
                  height: 38,
                  decoration: buttonDecoration,
                  child: new Center(
                    child: new Text(
                      'CANCEL 3',
                      style: buttonSmallTextStyle,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: new InkWell(
                onTap: () => concurrentExecutionTab.runCancel(0),
                child: new Container(
                  width: 76,
                  height: 38,
                  decoration: buttonDecoration,
                  child: new Center(
                    child: new Text(
                      'CANCEL ALL',
                      style: buttonSmallTextStyle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Container(
              alignment: Alignment(-1.0, -1.0),
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(4.0),
              decoration: outputDecoration,
              child: SingleChildScrollView(
                  reverse: true,
                  child: Text(concurrentExecutionTab.getOutputText()))),
        )
      ],
    );
  }
}
