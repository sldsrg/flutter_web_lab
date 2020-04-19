import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;
import 'dart:ui' as ui;

class PermissionsLabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Demo'),
      ),
      body: CameraLab(),
    );
  }
}

class CameraLab extends StatefulWidget {
  @override
  _CameraLabState createState() => _CameraLabState();
}

class _CameraLabState extends State<CameraLab> {
  String status = '';

  // Webcam widget to insert into the tree
  Widget _webcamWidget;
  // VideoElement
  html.VideoElement _webcamVideoElement;

  @override
  void initState() {
    super.initState();
    _webcamVideoElement = html.VideoElement()
      ..autoplay = true
      ..style.border = 'none';

    // ignore:undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'webcamVideoElement',
      (int viewId) => _webcamVideoElement,
    );
    _webcamWidget = HtmlElementView(key: UniqueKey(), viewType: 'webcamVideoElement');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 640,
            height: 480,
            child: _webcamWidget,
          ),
          RaisedButton(
            child: Text("Request permission"),
            onPressed: () async {
              final perm = await html.window.navigator.permissions.query({"name": "camera"});
              setState(() {
                status = perm.state;
              });
              if (perm.state == "denied") {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Oops! Camera access denied!"),
                  backgroundColor: Colors.orangeAccent,
                ));
                return;
              }
              _webcamVideoElement.srcObject = await html.window.navigator.getUserMedia(video: true);
              // html.document.querySelector('flt-platform-view').shadowRoot.querySelector('video');
            },
          ),
          Text(status),
        ],
      ),
    );
  }
}
