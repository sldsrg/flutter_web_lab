import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'routes.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter for web labs'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(FontAwesomeIcons.stackOverflow),
        onPressed: () {
          html.window.location.assign('http://stackoverflow.com');
        },
      ),
      body: ListView(
        children: routes
            .map(
              (def) => ListTile(
                title: Text(def.title),
                onTap: () {
                  Navigator.of(context).pushNamed(def.path);
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
