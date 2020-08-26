import 'dart:html' as html;
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class HrefLabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyWidget(),
      ),
    );
  }
}

class ItemUrlPolicy implements html.UriPolicy {
  RegExp regex = RegExp(r'(?:http://|https://)?.*');

  bool allowsUri(String uri) {
    return regex.hasMatch(uri);
  }
}

class MyWidget extends StatefulWidget {
  @override
  MyWidgetState createState() => MyWidgetState();
}

class MyWidgetState extends State<MyWidget> {
  html.DivElement _element;

  @override
  void initState() {
    super.initState();
    _element = html.DivElement()
      ..appendHtml("""
            <a href='https://play.google.com/store/apps/details?id=org.ebookdroid'>
              <img alt='Get it on Google Play' src='https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png'/>
            </a>
          """,
          validator: html.NodeValidatorBuilder()
            ..allowHtml5(uriPolicy: ItemUrlPolicy())
            ..allowNavigation(ItemUrlPolicy())
            ..allowImages(ItemUrlPolicy()));
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory('demo-view', (int viewId) => _element);
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(key: UniqueKey(), viewType: "demo-view");
  }
}
