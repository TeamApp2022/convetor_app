import 'package:convertor_app/constants/constants.dart';
import 'package:convertor_app/helpers/decoration.dart';
import 'package:flutter/material.dart';


class HttpScreen extends StatefulWidget {
  @override
  _HttpScreenState createState() => _HttpScreenState();
}

class _HttpScreenState extends State<HttpScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 40),
          child: TextField(
            controller: httpsTab.getUrlText(),
            decoration: inputDecoration('Enter https url'),
            style: textFieldStyle,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 20),
          child: new InkWell(
            onTap: () => httpsTab.runGetMediaInformation(),
            child: new Container(
              width: 130,
              height: 38,
              decoration: buttonDecoration,
              child: new Center(
                child: new Text(
                  'GET INFO',
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
                  reverse: true, child: Text(httpsTab.getOutputText()))),
        )
      ],
    );
  }
}
