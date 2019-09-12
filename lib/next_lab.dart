import 'package:flutter/material.dart';

class NextLabPage extends StatefulWidget {
  @override
  _NextLabPageState createState() => _NextLabPageState();
}

class _NextLabPageState extends State<NextLabPage> {
  final myController = TextEditingController();

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
