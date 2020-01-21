import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesLabPage extends StatefulWidget {
  @override
  _SharedPreferencesLabPageState createState() =>
      _SharedPreferencesLabPageState();
}

class _SharedPreferencesLabPageState extends State<SharedPreferencesLabPage> {
  int counter;
  SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _initCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('$counter', textScaleFactor: 3),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one),
        onPressed: _incrementCounter,
      ),
    );
  }

  _initCounter() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = (prefs.getInt('counter') ?? 0);
    });
  }

  _incrementCounter() async {
    setState(() {
      counter++;
    });
    await prefs.setInt('counter', counter);
  }
}
