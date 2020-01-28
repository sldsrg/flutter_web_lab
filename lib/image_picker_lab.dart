import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:universal_html/prefer_universal/html.dart' as html;

class ImagePickerLabPage extends StatefulWidget {
  @override
  _ImagePickerLabPageState createState() => _ImagePickerLabPageState();
}

class _ImagePickerLabPageState extends State<ImagePickerLabPage> {
  String name = '';
  String error;
  Uint8List data;
  html.FormElement form;

  pickImage() {
    final input = html.document.createElement('input') as html.InputElement
      ..type = 'file'
      ..accept = 'image/*'
      ..name = 'avatar'
      ..onChange.listen((event) {
        final target = event.target as html.InputElement;
        if (target.files.isEmpty) return;
        final reader = html.FileReader();
        reader.readAsDataUrl(target.files[0]);
        reader.onError.listen((err) => setState(() {
              error = err.toString();
            }));
        reader.onLoad.first.then((res) {
          final encoded = reader.result as String;
          // remove data:image/*;base64 preambule
          final stripped =
              encoded.replaceFirst(RegExp(r'data:image/[^;]+;base64,'), '');

          setState(() {
            name = target.files[0].name;
            data = base64.decode(stripped);
            error = null;
          });
        });
      });

    form = html.document.createElement('form') as html.FormElement
      ..method = 'POST'
      ..enctype = "multipart/form-data"
      ..action = '/profile'
      ..children.add(input);
    html.document.body.children.add(form);

    input.click();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Pick'),
                onPressed: pickImage,
              ),
              SizedBox(
                width: 16,
              ),
              RaisedButton(
                child: Text('Upload'),
                onPressed: () {
                  form?.submit();
                },
              )
            ],
          ),
          Expanded(
            child: Center(
              child: error != null
                  ? Text(error)
                  : data != null ? Image.memory(data) : Text('No data...'),
            ),
          ),
        ],
      ),
    );
  }
}
