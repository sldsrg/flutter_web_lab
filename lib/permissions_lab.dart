import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class PermissionsLabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Camera Demo'),
        ),
        body: CameraLab(),
      ),
    );
  }
}

class CameraLab extends StatefulWidget {
  @override
  _CameraLabState createState() => _CameraLabState();
}

class _CameraLabState extends State<CameraLab> {
  String status = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
              // final stream = await html.window.navigator.getUserMedia(video: true);
              // ...
            },
          ),
          Text(status),
        ],
      ),
    );
  }
}
