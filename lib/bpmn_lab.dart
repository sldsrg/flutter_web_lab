import 'dart:ui' as ui;
import 'dart:js' as js;
import 'package:universal_html/html.dart' as html;
import 'package:flutter/material.dart';

class BpmnLabPage extends StatefulWidget {
  @override
  _BpmnLabPageState createState() => _BpmnLabPageState();
}

class _BpmnLabPageState extends State<BpmnLabPage> {
  html.DivElement _element;
  js.JsObject _viewer;

  @override
  void initState() {
    super.initState();
    _element = html.DivElement();
    _viewer = js.JsObject(
      js.context['BpmnJS'],
      [
        js.JsObject.jsify({'container': _element})
      ],
    );
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory('bpmn-view', (int viewId) => _element);
    loadDiagram('assets/pizza-collaboration.bpmn');
  }

  loadDiagram(String src) async {
    final bundle = DefaultAssetBundle.of(context);
    final xml = await bundle.loadString(src);
    _viewer.callMethod('importXML', [xml]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: HtmlElementView(key: UniqueKey(), viewType: "bpmn-view")),
    );
  }
}
