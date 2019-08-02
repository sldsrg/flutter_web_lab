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

class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          constraints: BoxConstraints(
            minHeight: 50.0,
          ),
          child: Center(
            child: Text(
              'Top label',
              style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal),
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: 20,
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemBuilder: (context, index) {
              return Material(
                child: ListTile(
                  leading: CircleAvatar(),
                  title: Text('Test title'),
                ),
              );
            },
          ),
        ),
        Container(
          constraints: BoxConstraints(
            minHeight: 50.0,
          ),
          child: Center(
            child: Text(
              'Bottom label',
              style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal),
            ),
          ),
        ),
      ],
    );
  }
}