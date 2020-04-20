import 'dart:ui' as ui;
import 'package:universal_html/html.dart' as html;
import 'package:flutter/material.dart';

class BpmnLabPage extends StatefulWidget {
  @override
  _BpmnLabPageState createState() => _BpmnLabPageState();
}

class _BpmnLabPageState extends State<BpmnLabPage> {
  html.DivElement _element;

  @override
  void initState() {
    super.initState();

    _element = html.DivElement()
      ..id = 'canvas'
      ..append(html.ScriptElement()
        ..text = """
        const canvas = document.querySelector("flt-platform-view").shadowRoot.querySelector("#canvas");
        const viewer = new BpmnJS({ container: canvas });
        const uri = "https://cdn.staticaly.com/gh/bpmn-io/bpmn-js-examples/dfceecba/url-viewer/resources/pizza-collaboration.bpmn";
        fetch(uri).then(res => res.text().then(xml => viewer.importXML(xml)));
        """);

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry
        .registerViewFactory('bpmn-view', (int viewId) => _element);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: HtmlElementView(key: UniqueKey(), viewType: "bpmn-view")),
    );
  }
}
