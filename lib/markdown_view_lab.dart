import 'dart:html' as html;
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;

class ItemUrlPolicy implements html.UriPolicy {
  RegExp regex = RegExp(r'(?:http://|https://|//)?.*');

  bool allowsUri(String uri) {
    return regex.hasMatch(uri);
  }
}

class MarkdownViewPage extends StatefulWidget {
  @override
  _MarkdownViewPageState createState() => _MarkdownViewPageState();
}

class _MarkdownViewPageState extends State<MarkdownViewPage> {
  html.DivElement _element;

  @override
  void initState() {
    super.initState();
    _element = html.DivElement()
      ..style.boxSizing = 'border-box'
      ..onWheel.listen((event) {
        _element.scrollBy(0, event.deltaY);
      })
      ..onClick.listen((event) {
        print('CLICK');
        print(event.target.runtimeType);
        event.preventDefault();
      })
      ..style.padding = '1rem'
      ..style.overflow = 'auto';
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory('markdown-view', (int viewId) => _element);
    _loadAssets(context);
  }

  _loadAssets(BuildContext context) async {
    final bundle = DefaultAssetBundle.of(context);
    final text = await bundle.loadString('assets/test.md');
    _element.appendHtml(
        md.markdownToHtml(
          text,
          extensionSet: md.ExtensionSet.gitHubWeb,
        ),
        validator: html.NodeValidatorBuilder()
          ..allowHtml5(uriPolicy: ItemUrlPolicy())
          ..allowNavigation(ItemUrlPolicy())
          ..allowImages(ItemUrlPolicy()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Markdown View lab')),
      body: HtmlElementView(key: UniqueKey(), viewType: "markdown-view"),
    );
  }
}
