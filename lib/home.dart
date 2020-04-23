import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'assets_lab.dart';
import 'bpmn_lab.dart';
import 'download_from_memory_lab.dart';
import 'focus_carousel_lab.dart';
import 'fonts_lab.dart';
import 'localizations_lab.dart';
import 'markdown_lab.dart';
import 'http_lab.dart';
import 'image_picker_lab.dart';
import 'js_lab.dart';
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
import 'paypal_buttons.dart';
import 'permissions_lab.dart';
import 'shared_preferences_lab.dart';
import 'storage_lab.dart';
import 'table_lab.dart';
import 'listenable_lab.dart';

final builders = {
  'Next lab': (_) => NextLabPage(),
  'AnimatedList lab': (_) => AnimatedListLabPage(),
  'AnimatedWrap lab': (_) => AnimatedWrapLabPage(),
  'Assets lab': (_) => AssetsLabPage(),
  'Animated Gif lab': (_) => AnimatedGifLabPage(),
  'Basic animation lab': (_) => BasicAnimationLabPage(),
  'Bpmn viewer lab': (_) => BpmnLabPage(),
  'Download from memory': (_) => DownloadFromMemoryLabPage(),
  'Firebase lab': (_) => FirebaseLabPage(),
  'Flex lab': (_) => FlexLabPage(),
  'Focus carousel lab': (_) => FocusCarouselLabPage(),
  'Focus node  lab': (_) => FocusNodeLabPage(),
  'Fonts lab': (_) => FontsLabPage(),
  'HTTP lab': (_) => HttpLabPage(),
  'Image picker lab': (_) => ImagePickerLabPage(),
  'JavaScript interop lab': (_) => JavaScriptLabPage(),
  'Listenable lab': (_) => ListenableLabPage(),
  'Localizations lab': (_) => LocalizationsLabPage(),
  'Markdown lab': (_) => MarkdownPage(),
  'Multi GridView lab': (_) => MultiGridLabPage(),
  'Nested ListView lab': (_) => NestedListViewLabPage(),
  'PayPal integration lab': (_) => PayPalLabPage(),
  'Permissions lab': (_) => PermissionsLabPage(),
  'Shared preferences lab': (_) => SharedPreferencesLabPage(),
  'Storage lab': (_) => StorageLabPage(),
  'Table lab': (_) => TableLabPage(),
};

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
