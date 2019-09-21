import 'package:flutter/material.dart';

import 'assets_lab.dart';
// import 'markdown_lab.dart';
import 'http_lab.dart';
import 'next_lab.dart';
import 'animated_gif_lab.dart';
import 'animated_list_lab.dart';
import 'animated_wrap_lab.dart';
import 'basic_animation_lab.dart';
import 'flex_lab.dart';
import 'focus_node_lab.dart';
import 'multi_grid_lab.dart';
import 'nested_listview.dart';
import 'storage_lab.dart';
import 'table_lab.dart';
import 'listenable_lab.dart';

final builders = {
  'Next lab': (_) => NextLabPage(),
  'HTTP lab': (_) => HttpLabPage(),
  'Storage lab': (_) => StorageLabPage(),
  'Assets lab': (_) => AssetsLabPage(),
  'Animated Gif lab': (_) => AnimatedGifLabPage(),
  'Flex lab': (_) => FlexLabPage(),
  'Focus node  lab': (_) => FocusNodeLabPage(),
  'AnimatedWrap lab': (_) => AnimatedWrapLabPage(),
  'AnimatedList lab': (_) => AnimatedListLabPage(),
  'Basic animation lab': (_) => BasicAnimationLabPage(),
  'Listenable lab': (_) => ListenableLabPage(),
  // 'Markdown lab': (_) => MarkdownPage(),
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
