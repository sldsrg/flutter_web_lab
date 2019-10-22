import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  initializeApp(
      apiKey: "AIzaSyBI1DrMfUH0boPdlL_9XJ_Eh1SGV_mWaYQ",
      authDomain: "example-7bd4e.firebaseapp.com",
      databaseURL: "https://example-7bd4e.firebaseio.com",
      projectId: "example-7bd4e",
      storageBucket: "example-7bd4e.appspot.com");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage());
  }
}
