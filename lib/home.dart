import 'package:flutter_web/material.dart';
import 'package:web_lab/markdown_lab.dart';

import 'multi_grid_lab.dart';
import 'table_lab.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Markdown lab'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => MarkdownPage()),
              );
            },
          ),
          ListTile(
            title: Text('Table lab'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => TableLabPage()),
              );
            },
          ),
          ListTile(
            title: Text('Multi GridView lab'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => MultiGridLabPage()),
              );
            },
          )
        ],
      ),
    );
  }
}
