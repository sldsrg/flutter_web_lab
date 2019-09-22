import 'package:flutter/material.dart';
import 'package:universal_html/prefer_universal/html.dart' as html;

class StorageLabPage extends StatefulWidget {
  @override
  _StorageLabPageState createState() => _StorageLabPageState();
}

class _StorageLabPageState extends State<StorageLabPage> {
  final myController = TextEditingController();
  html.Storage _localStorage;

  String file = '';
  String error = '';
  String data = '';
  pick() {
    final html.InputElement input = html.document.createElement('input');
    input
      ..type = 'file'
      ..accept = 'image/*';

    input.onChange.listen((e) {
      var reader = html.FileReader();
      reader.readAsDataUrl(input.files[0]);
      reader.onError.listen((error) => setState(() {
            error = error;
          }));
      reader.onLoad.first.then((res) {
        setState(() {
          file = input.files[0].name;
          data = reader.result as String;
        });
      });
    });

    input.click();
  }

  String test;

  @override
  void initState() {
    super.initState();
    _localStorage = html.window.localStorage;
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
      appBar: AppBar(
        title: Text(file),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          pick();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(file),
            TextField(
              controller: myController,
            ),
          ],
        ),
      ),
    );
  }
}
