import 'package:flutter_web/material.dart';
import 'package:web_lab/markdown_lab.dart';

import 'multi_grid_lab.dart';
import 'nested_listview.dart';
import 'next_lab.dart';
import 'table_lab.dart';
import 'listenable_lab.dart';

final builders = {
  'Next lab': (_) => NextLabPage(),
  'Listenable lab': (_) => ListenableLabPage(),
  'Markdown lab': (_) => MarkdownPage(),
  'Table lab': (_) => TableLabPage(),
  'Nested ListView lab': (_) => NestedListViewLabPage(),
  'Multi GridView lab': (_) => MultiGridLabPage(),
};

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: builders.entries
            .map(
              (entry) => ListTile(
                    title: Text(entry.key),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: entry.value),
                      );
                    },
                  ),
            )
            .toList(),
      ),
    );
  }
}
