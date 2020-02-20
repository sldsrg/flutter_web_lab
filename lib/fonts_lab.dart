import 'package:flutter/material.dart';

class FontsLabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "This text style uses a font loaded from assets",
              style: TextStyle(fontFamily: 'NovaCut'),
            ),
            SizedBox(height: 16),
            Text(
              "This text style uses a font loaded from web (googleapis.com)",
              style: TextStyle(fontFamily: 'Raleway'),
            ),
          ],
        ),
      ),
    );
  }
}
