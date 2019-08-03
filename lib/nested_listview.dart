import 'package:flutter_web/material.dart';

class NestedListViewLabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TestWidget(),
    );
  }
}

class TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  final _scrollController = ScrollController();
  bool _showIntro;

  @override
  void initState() {
    _scrollController.addListener(onScroll);
    _showIntro = true;
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _showIntro
            ? Container(
                color: Colors.teal[100],
                child: Text(
                  'lorem ipsum dolar sit amet lorem ipsum dolar sit amet lorem ipsum dolar sit amet lorem ipsum dolar sit amet ',
                  style: Theme.of(context).textTheme.title,
                ),
              )
            : Container(),
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: 20,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(),
                title: Text('Item #$index'),
              );
            },
          ),
        ),
      ],
    );
  }

  void onScroll() {
    setState(() {
      _showIntro = _scrollController.offset < 50;
    });
  }
}
