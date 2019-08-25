import 'dart:math' as math;

import 'package:flutter_for_web/material.dart';

class Item {
  final String title;
  bool dismissed;

  Item(this.title, this.dismissed);
}

class MultiGridLabPage extends StatefulWidget {
  MultiGridLabPage({
    Key key,
  }) : super(key: key);

  @override
  _MultiGridLabPageState createState() => _MultiGridLabPageState();
}

class _MultiGridLabPageState extends State<MultiGridLabPage> {
  List<Item> items;

  @override
  void initState() {
    super.initState();
    var rnd = math.Random();
    items = List<Item>.generate(32, (i) => Item('Item $i', rnd.nextBool()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Multi grid lab.'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              SizedBox(
                height:
                    MediaQuery.of(context).size.height - 16.0 - kToolbarHeight,
                width: MediaQuery.of(context).size.width / 2 - 16.0,
                child: GridView.extent(
                  maxCrossAxisExtent: 150.0,
                  childAspectRatio: 2.0,
                  children: _buildList(false),
                ),
              ),
              SizedBox(
                height:
                    MediaQuery.of(context).size.height - 16.0 - kToolbarHeight,
                width: 16.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7.0),
                  child: Container(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              SizedBox(
                height:
                    MediaQuery.of(context).size.height - 16.0 - kToolbarHeight,
                width: MediaQuery.of(context).size.width / 2 - 16.0,
                child: GridView.extent(
                  maxCrossAxisExtent: 150.0,
                  childAspectRatio: 2.0,
                  children: _buildList(true),
                ),
              ),
            ],
          ),
        ));
  }

  List<Widget> _buildList(bool flag) {
    return items
        .where((item) => item.dismissed == flag)
        .map(
          (item) => Dismissible(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(item.title),
              ),
            ),
            key: ValueKey(item.title),
            onDismissed: (dir) => setState(() {
              item.dismissed = !item.dismissed;
            }),
          ),
        )
        .toList();
  }
}
