import 'package:flutter_for_web/material.dart';

class FocusNodeLabPage extends StatefulWidget {
  @override
  _FocusNodeLabPageState createState() => _FocusNodeLabPageState();
}

class _FocusNodeLabPageState extends State<FocusNodeLabPage> {
  FocusNode myFocusNode;

  @override
  void initState() {
    myFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Item 1'),
            subtitle: TextField(),
          ),
          ListTile(
            title: Text('Item 2'),
            subtitle: TextField(
              focusNode: myFocusNode,
            ),
          ),
          ListTile(
            title: Text('Item 3'),
            subtitle: TextField(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () {
          FocusScope.of(context).requestFocus(myFocusNode);
          //myFocusNode.requestFocus();
        },
      ),
    );
  }
}
