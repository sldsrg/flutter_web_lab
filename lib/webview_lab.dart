import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:easy_web_view/easy_web_view.dart';

class WebviewLabPage extends StatefulWidget {
  @override
  _WebviewLabPageState createState() => _WebviewLabPageState();
}

class _WebviewLabPageState extends State<WebviewLabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: EasyWebView(
          isMarkdown: false,
          isHtml: true,
          src: src, // 'https://flutter.dev',
          onLoaded: () {
            print('Loaded');
          },
        ),
      ),
    );
  }

  String get src => md.markdownToHtml(
        '''
# This is a heading
## Here's a smaller heading
This is a paragraph
* Here's a bulleted list
* Another item
1. And an ordered list
1. The numbers don't matter
> This is a qoute

[This is a link to Flutter](https://flutter.dev)


|||
|---|---|
| **Negative (of 'play')** |
| I **do not** play | I **don't** play |
| you **do not** play | you **don't** play |
| he **do**es **not** play | he **do**es**n't** play |
| she **do**es **not** play | she **do**es**n't** play |
| it **do**es **not** play | it **do**es**n't** play |
| we **do not** play | we **don't** play |
| they **do not** play | they **don't** play |
''',
        extensionSet: md.ExtensionSet.gitHubWeb,
      );
}
