import 'package:flutter_web/material.dart';

class TableLabPage extends StatelessWidget {
  TableLabPage({
    Key key,
  }) : super(key: key);

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
                    TableCell(child: Container()),
                    TableCell(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height -
                            kToolbarHeight -
                            64.0,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Wrap(
                            children: buildList(),
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
        ));
  }

  SingleChildScrollView buildSingleChildScrollView() {
    return SingleChildScrollView(
      child: GridView.extent(
        maxCrossAxisExtent: 150.0,
        children: buildList(),
      ),
      scrollDirection: Axis.vertical,
    );
  }

  List<Widget> buildList() {
    return List.generate(
      32,
      (i) => Draggable(
            affinity: Axis.horizontal,
            feedback: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Item $i'),
              ),
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Item $i'),
              ),
            ),
          ),
    );
  }
}
