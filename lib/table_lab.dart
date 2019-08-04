import 'dart:math' as math;

import 'package:flutter_web/material.dart';

var rnd = math.Random();

class Item {
  final String title;
  bool dismissed;

  Item(this.title, this.dismissed);
}

class TableLabPage extends StatefulWidget {
  TableLabPage({
    Key key,
  }) : super(key: key);

  @override
  _TableLabPageState createState() => _TableLabPageState();
}

class _TableLabPageState extends State<TableLabPage> {
  List<Item> items;

  @override
  void initState() {
    super.initState();
    items = List<Item>.generate(32, (i) => Item('Item $i', rnd.nextBool()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Table lab.'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text('Header'),
              Table(border: TableBorder.all(), children: <TableRow>[
                TableRow(children: <TableCell>[
                  TableCell(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('countable'),
                  )),
                  TableCell(child: Container()),
                  TableCell(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('uncountable'),
                  )),
                ]),
                TableRow(children: <TableCell>[
                  TableCell(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height -
                          kToolbarHeight -
                          64.0,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Wrap(
                          children: buildList(true),
                        ),
                      ),
                    ), //buildSingleChildScrollView(),
                  ),
                  TableCell(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height -
                          kToolbarHeight -
                          64.0,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Wrap(
                          children: buildList(false),
                        ),
                      ),
                    ), //buildSingleChildScrollView(),
                  ),
                  TableCell(child: Container()),
                ])
              ]),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one),
        onPressed: () {
          setState(() {
            items.add(Item('Item ${items.length}', rnd.nextBool()));
          });
        },
      ),
    );
  }

  SingleChildScrollView buildSingleChildScrollView(bool flag) {
    return SingleChildScrollView(
      child: GridView.extent(
        maxCrossAxisExtent: 150.0,
        children: buildList(flag),
      ),
      scrollDirection: Axis.vertical,
    );
  }

  List<Widget> buildList(bool flag) {
    return items
        .where((item) => item.dismissed == flag)
        .map(
          (item) => Draggable(
                affinity: Axis.horizontal,
                feedback: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(item.title),
                  ),
                ),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(item.title),
                  ),
                ),
              ),
        )
        .toList();
  }
}
