import 'package:flutter/material.dart';

class FocusCarouselLabPage extends StatefulWidget {
  @override
  _FocusCarouselLabPageState createState() => _FocusCarouselLabPageState();
}

class _FocusCarouselLabPageState extends State<FocusCarouselLabPage> {
  final controllers = Map<String, TextEditingController>();
  final focusNodes = Map<String, FocusNode>();
  final bom = List<Map<String, double>>();

  @override
  void initState() {
    controllers['width'] = TextEditingController();
    controllers['height'] = TextEditingController();
    controllers['amount'] = TextEditingController();
    focusNodes['width'] = FocusNode();
    focusNodes['height'] = FocusNode();
    focusNodes['amount'] = FocusNode();
    focusNodes.forEach((key, node) {
      final ctl = controllers[key];
      node.addListener(() {
        if (node.hasFocus) {
          final text = ctl.text;
          ctl.selection = TextSelection(baseOffset: 0, extentOffset: text.length);
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controllers.forEach((k, v) => dispose());
    focusNodes.forEach((k, v) => dispose());
    super.dispose();
  }

  void append() {
    focusNodes['width'].requestFocus();
    setState(() {
      bom.add({
        'width': double.parse(controllers['width'].text),
        'height': double.parse(controllers['height'].text),
        'amount': double.parse(controllers['amount'].text),
      });
    });
  }

  Widget buildBom() {
    return Table(
      border: TableBorder.all(),
      children: bom
          .map(
            (item) => TableRow(
              children: [
                TableCell(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(item['width'].toString()),
                )),
                TableCell(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(item['height'].toString()),
                )),
                TableCell(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(item['amount'].toString()),
                )),
              ],
            ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            buildBom(),
            Table(
              children: <TableRow>[
                TableRow(children: <TableCell>[
                  TableCell(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            autofocus: true,
                            controller: controllers['width'],
                            decoration: InputDecoration(hintText: 'width'),
                            focusNode: focusNodes['width'],
                            onEditingComplete: focusNodes['height'].requestFocus,
                          ))),
                  TableCell(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: controllers['height'],
                            decoration: InputDecoration(hintText: 'height'),
                            focusNode: focusNodes['height'],
                            onEditingComplete: focusNodes['amount'].requestFocus,
                          ))),
                  TableCell(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: controllers['amount'],
                            decoration: InputDecoration(hintText: 'amount'),
                            focusNode: focusNodes['amount'],
                            onEditingComplete: append,
                          ))),
                ]),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
