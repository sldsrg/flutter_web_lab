import 'package:flutter_web/material.dart';
import 'package:web_lab/markdown_lab.dart';

import 'multi_grid_lab.dart';
import 'next_lab.dart';
import 'table_lab.dart';

final builders = {
  'Next lab': (_) => NextLabPage(),
  'Markdown lab': (_) => MarkdownPage(),
  'Table lab': (_) => TableLabPage(),
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
