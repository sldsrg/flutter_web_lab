import 'dart:math' as math;

import 'package:flutter/material.dart';

var rnd = math.Random();

class Item {
  final String title;
  bool dismissed;

  Item(this.title, this.dismissed);
}

typedef Callback(Item item);

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
                      child: Acceptor(
                        children: buildList(false),
                        callback: (item) {
                          setState(() {
                            item.dismissed = false;
                          });
                        },
                      ),
                    ), //buildSingleChildScrollView(),
                  ),
                  TableCell(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height -
                          kToolbarHeight -
                          64.0,
                      child: Acceptor(
                        children: buildList(null),
                        callback: (item) {
                          setState(() {
                            item.dismissed = null;
                          });
                        },
                      ),
                    ), //buildSingleChildScrollView(),
                  ),
                  TableCell(
                      child: SizedBox(
                    height: MediaQuery.of(context).size.height -
                        kToolbarHeight -
                        64.0,
                    child: Acceptor(
                      children: buildList(true),
                      callback: (item) {
                        setState(() {
                          item.dismissed = true;
                        });
                      },
                    ),
                  )),
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
            items.add(Item('Item ${items.length}', null));
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
            data: item,
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

class Acceptor extends StatefulWidget {
  final List<Widget> children;
  final Callback callback;

  const Acceptor({
    Key key,
    this.children,
    this.callback,
  }) : super(key: key);

  @override
  _AcceptorState createState() => _AcceptorState();
}

class _AcceptorState extends State<Acceptor> {
  bool _active;

  @override
  void initState() {
    super.initState();
    _active = false;
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget(
      builder: (
        BuildContext context,
        List candidateData,
        List rejectedData,
      ) {
        return Container(
          color: _active ? Colors.yellow[100] : null,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Wrap(
              children: widget.children,
            ),
          ),
        );
      },
      onWillAccept: (data) {
        setState(() {
          _active = true;
        });
        return true;
      },
      onLeave: (data) {
        setState(() {
          _active = false;
        });
      },
      onAccept: (Item data) {
        widget.callback(data);
        setState(() {
          _active = false;
        });
      },
    );
  }
}
