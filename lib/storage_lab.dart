import 'package:flutter/material.dart';
import 'package:universal_html/prefer_universal/html.dart';

class StorageLabPage extends StatefulWidget {
  @override
  _StorageLabPageState createState() => _StorageLabPageState();
}

class _StorageLabPageState extends State<StorageLabPage> {
  final myController = TextEditingController();
  Storage _localStorage;

  String test;

  @override
  void initState() {
    super.initState();
    _localStorage = window.localStorage;
    print(_localStorage['mypref']);
    myController.text = _localStorage['mypref'];
    myController.addListener(() {
      _localStorage['mypref'] = myController.text;
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
        ),
      ),
    );
  }
}
