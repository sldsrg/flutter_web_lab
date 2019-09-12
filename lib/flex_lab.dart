import 'package:flutter/material.dart';

class FlexLabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        children: <Widget>[
          Flexible(child: Container(color: Colors.red)),
          Flexible(
              child: Container(
            constraints: BoxConstraints.expand(),
            color: Colors.yellow,
            child: Column(
              children: <Widget>[
                Flexible(flex: 0, child: Container(child: Text('Header'))),
                Flexible(
                  flex: 1,
                  child: Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          FlutterLogo(size: 96.0),
                          FlutterLogo(size: 96.0),
                          FlutterLogo(size: 96.0),
                          FlutterLogo(size: 96.0),
                          FlutterLogo(size: 96.0),
                          FlutterLogo(size: 96.0),
                          FlutterLogo(size: 96.0),
                          FlutterLogo(size: 96.0),
                          FlutterLogo(size: 96.0),
                          FlutterLogo(size: 96.0),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
          Flexible(child: Container(color: Colors.green)),
        ],
      ),
    );
  }
}
