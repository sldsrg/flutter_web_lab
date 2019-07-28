import 'package:flutter_web/material.dart';
import 'package:web_lab/multi_grid_lab.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiGridLabPage(),
    );
  }
}
