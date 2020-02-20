import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:universal_html/prefer_universal/html.dart' as html;

class DownloadFromMemoryLabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: RaisedButton(
            child: Text("download"),
            onPressed: () {
              final text = 'this is the text file';

              // prepare
              final bytes = utf8.encode(text);
              final blob = html.Blob([bytes]);
              final url = html.Url.createObjectUrlFromBlob(blob);
              final anchor = html.document.createElement('a') as html.AnchorElement
                ..href = url
                ..style.display = 'none'
                ..download = 'some_name.txt';
              html.document.body.children.add(anchor);

              // download
              anchor.click();

              // cleanup
              html.document.body.children.remove(anchor);
              html.Url.revokeObjectUrl(url);
            }),
      ),
    );
  }
}
