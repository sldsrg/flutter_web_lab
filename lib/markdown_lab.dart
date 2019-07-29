import 'package:flutter_web/material.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';

class MarkdownPage extends StatefulWidget {
  @override
  _MarkdownPageState createState() => _MarkdownPageState();
}

class _MarkdownPageState extends State<MarkdownPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Markdown lab'),
      ),
      body: FutureBuilder(
        future: _text(context),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Unable to load asset file');
          }
          if (snapshot.hasData) {
            return Text(
                'Waiting stable flutter for web'); //  Markdown(data: snapshot.data);
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Future<String> _text(BuildContext context) async {
    final bundle = DefaultAssetBundle.of(context);
    final text = await bundle.loadString('test.md');
    return text;
  }
}
