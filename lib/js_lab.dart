import 'dart:js' as js;
import 'package:flutter/material.dart';

class JavaScriptLabPage extends StatefulWidget {
  @override
  _JavaScriptLabPageState createState() => _JavaScriptLabPageState();
}

class _JavaScriptLabPageState extends State<JavaScriptLabPage> {
  String response1 = "Waiting...";
  String response2 = "Waiting...";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          RaisedButton(
            onPressed: () {
              var object = js.JsObject(js.context['Object']);
              object['greeting'] = 'Hello';
              object['greet'] = (name) => "${object['greeting']} $name";
              var message = object.callMethod('greet', ['JavaScript']);
              js.context['console'].callMethod('log', [message]);
            },
            child: Text("console.log from JavaScript"),
          ),
          SizedBox(
            height: 24,
          ),
          RaisedButton(
            onPressed: () {
              js.context.callMethod('setTimeout', [
                () {
                  setState(() {
                    response1 = 'Ok';
                  });
                },
                5000,
              ]);
            },
            child: Text("Delayed call from JavaScript"),
          ),
          Text(response1),
          SizedBox(
            height: 24,
          ),
          RaisedButton(
            onPressed: () {
              js.context['feedback'] = (msg) {
                setState(() {
                  response2 = msg;
                });
              };
              js.context.callMethod('feedback', ["message from js context"]);
            },
            child: Text("Custom JavaScript function"),
          ),
          Text(response2),
        ]),
      ),
    );
  }
}
