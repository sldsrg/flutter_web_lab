import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'routes.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<String>('favorites');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter for web labs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      onGenerateRoute: RouteConfiguration.onGenerateRoute,
    );
  }
}
