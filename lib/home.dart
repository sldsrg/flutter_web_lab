import 'package:flutter/material.dart';
import 'package:universal_html/prefer_universal/html.dart' as html;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'assets_lab.dart';
import 'download_from_memory_lab.dart';
import 'markdown_lab.dart';
import 'http_lab.dart';
import 'image_picker_lab.dart';
import 'next_lab.dart';
import 'animated_gif_lab.dart';
import 'animated_list_lab.dart';
import 'animated_wrap_lab.dart';
import 'basic_animation_lab.dart';
import 'firebase_lab.dart';
import 'flex_lab.dart';
import 'focus_node_lab.dart';
import 'multi_grid_lab.dart';
import 'nested_listview.dart';
import 'sharedprefs_lab.dart';
import 'storage_lab.dart';
import 'table_lab.dart';
import 'listenable_lab.dart';

final builders = {
  'Next lab': (_) => NextLabPage(),
  'Download from memory': (_) => DownloadFromMemoryLabPage(),
  'Firebase lab': (_) => FirebaseLabPage(),
  'HTTP lab': (_) => HttpLabPage(),
  'Image picker lab': (_) => ImagePickerLabPage(),
  'Shared prferences lab': (_) => SharedPreferencesLabPage(),
  'Storage lab': (_) => StorageLabPage(),
  'Assets lab': (_) => AssetsLabPage(),
  'Animated Gif lab': (_) => AnimatedGifLabPage(),
  'Flex lab': (_) => FlexLabPage(),
  'Focus node  lab': (_) => FocusNodeLabPage(),
  'AnimatedWrap lab': (_) => AnimatedWrapLabPage(),
  'AnimatedList lab': (_) => AnimatedListLabPage(),
  'Basic animation lab': (_) => BasicAnimationLabPage(),
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
      floatingActionButton: FloatingActionButton(
        child: Icon(FontAwesomeIcons.stackOverflow),
        onPressed: () {
          html.window.location.assign('http://stackoverflow.com');
        },
      ),
      body: ListView(
        children: builders.entries
            .map(
              (entry) => ListTile(
                title: Text(
                  entry.key,
                  style: TextStyle(fontFamily: 'Raleway'),
                ),
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
