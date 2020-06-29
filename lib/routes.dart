import 'package:flutter/material.dart';

import 'home.dart';
import 'assets_lab.dart';
import 'bpmn_lab.dart';
import 'download_from_memory_lab.dart';
import 'focus_carousel_lab.dart';
import 'fonts_lab.dart';
import 'google_sign_in_lab.dart';
import 'hive_lab.dart';
import 'localizations_lab.dart';
import 'markdown_lab.dart';
import 'markdown_view_lab.dart';
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
import 'page_view_lab.dart';
import 'paypal_buttons.dart';
import 'pdf_lab.dart';
import 'permissions_lab.dart';
import 'shared_preferences_lab.dart';
import 'storage_lab.dart';
import 'table_lab.dart';
import 'listenable_lab.dart';
import 'iframe_lab.dart';
import 'webview_lab.dart';

class RouteDef {
  final String path;
  final String title;
  final WidgetBuilder builder;

  const RouteDef(this.path, this.title, this.builder);
}

final routes = <RouteDef>[
  RouteDef('/next', 'Next lab', (_) => NextLabPage()),
  RouteDef('/webview', 'Webview lab', (_) => WebviewLabPage()),
  RouteDef('/hive', 'Hive lab', (_) => HiveLabPage()),
  RouteDef('/animated-list', 'AnimatedList lab', (_) => AnimatedListLabPage()),
  RouteDef('/animated-wrap', 'AnimatedWrap lab', (_) => AnimatedWrapLabPage()),
  RouteDef('/assets', 'Assets lab', (_) => AssetsLabPage()),
  RouteDef('/animated-gif', 'Animated Gif lab', (_) => AnimatedGifLabPage()),
  RouteDef('/basic-animation', 'Basic animation lab', (_) => BasicAnimationLabPage()),
  RouteDef('/bpmn-viewer', 'Bpmn viewer lab', (_) => BpmnLabPage()),
  RouteDef('/download-from-memory', 'Download from memory', (_) => DownloadFromMemoryLabPage()),
  RouteDef('/firebase', 'Firebase lab', (_) => FirebaseLabPage()),
  RouteDef('/flex', 'Flex lab', (_) => FlexLabPage()),
  RouteDef('/focus-carousel', 'Focus carousel lab', (_) => FocusCarouselLabPage()),
  RouteDef('/focus-node', 'Focus node lab', (_) => FocusNodeLabPage()),
  RouteDef('/fonts', 'Fonts lab', (_) => FontsLabPage()),
  RouteDef('/google-sign-in', 'Google Sign-In lab', (_) => GoogleSignInLabPage()),
  RouteDef('/http', 'HTTP lab', (_) => HttpLabPage()),
  RouteDef('/iframe', 'IFrame lab', (_) => IFrameLabPage()),
  RouteDef('/image-picker', 'Image picker lab', (_) => ImagePickerLabPage()),
  RouteDef('/js-interop', 'JavaScript interop lab', (_) => JavaScriptLabPage()),
  RouteDef('/listenable', 'Listenable lab', (_) => ListenableLabPage()),
  RouteDef('/l10ns', 'Localizations lab', (_) => LocalizationsLabPage()),
  RouteDef('/md', 'Markdown lab', (_) => MarkdownPage()),
  RouteDef('/md-view', 'Markdown View lab', (_) => MarkdownViewPage()),
  RouteDef('/multi-grid-view', 'Multi GridView lab', (_) => MultiGridLabPage()),
  RouteDef('/nested-list-view', 'Nested ListView lab', (_) => NestedListViewLabPage()),
  RouteDef('/page-view', 'PageView Lab', (_) => PageViewLab()),
  RouteDef('/paypal', 'PayPal integration lab', (_) => PayPalLabPage()),
  RouteDef('/pdf', 'Pdf lab', (_) => PdfLabPage()),
  RouteDef('/permissions', 'Permissions lab', (_) => PermissionsLabPage()),
  RouteDef('/shared-prefs', 'Shared preferences lab', (_) => SharedPreferencesLabPage()),
  RouteDef('/storage', 'Storage lab', (_) => StorageLabPage()),
  RouteDef('/table', 'Table lab', (_) => TableLabPage()),
];

class RouteConfiguration {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    for (var def in routes) {
      final regExpPattern = RegExp(def.path);
      if (regExpPattern.hasMatch(settings.name)) {
        final firstMatch = regExpPattern.firstMatch(settings.name);
        final match = (firstMatch.groupCount == 1) ? firstMatch.group(1) : null;
        return MaterialPageRoute<void>(
          builder: (context) => def.builder(context),
          settings: settings,
        );
      }
    }

    // If no match was found, route to home page.
    return MaterialPageRoute(
      builder: (_) => HomePage(),
      settings: settings,
    );
  }
}
