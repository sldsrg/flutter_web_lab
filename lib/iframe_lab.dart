import 'dart:ui' as ui;
import 'dart:js' as js;
import 'dart:html' as html;
import 'package:flutter/material.dart';

class IFrameLabPage extends StatefulWidget {
  @override
  _IFrameLabPageState createState() => _IFrameLabPageState();
}

class _IFrameLabPageState extends State<IFrameLabPage> {
  html.IFrameElement _element;
  js.JsObject _connector;

  @override
  void initState() {
    super.initState();

    js.context["connect_content_to_flutter"] = (content) {
      _connector = content;
    };

    _element = html.IFrameElement()
      ..style.border = 'none'
      ..srcdoc = """
        <!DOCTYPE html>
          <head>
            <script>
              // variant 1
              parent.connect_content_to_flutter && parent.connect_content_to_flutter(window)
              function hello(msg) {
                alert(msg)
              }

              // variant 2
              window.addEventListener("message", (message) => {
                if (message.data.id === "test") {
                  alert(message.data.msg)
                }
              })
            </script>
          </head>
          <body>
            <h2>I'm IFrame</h2>
          </body>
        </html>
        """;

    // ignore:undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'example',
      (int viewId) => _element,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.filter_1),
            tooltip: 'Test with connector',
            onPressed: () {
              _connector.callMethod('hello', ['Hello from first variant']);
            },
          ),
          IconButton(
            icon: Icon(Icons.filter_2),
            tooltip: 'Test with postMessage',
            onPressed: () {
              _element.contentWindow.postMessage({
                'id': 'test',
                'msg': 'Hello from second variant',
              }, "*");
            },
          ),
          IconButton(
            icon: Icon(Icons.filter_3),
            tooltip: 'Test with browserObject',
            onPressed: () {
              js.JsObject.fromBrowserObject(_element)['contentWindow']
                  .callMethod("alert", ["Third variant"]);
            },
          )
        ],
      ),
      body: Container(
        child: HtmlElementView(viewType: 'example'),
      ),
    );
  }
}
