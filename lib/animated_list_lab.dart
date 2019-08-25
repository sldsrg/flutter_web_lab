import 'package:flutter_for_web/material.dart';
import 'package:flutter_for_web/widgets.dart';

class AnimatedListLabPage extends StatelessWidget {
  final listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AnimatedList(
        key: listKey,
        initialItemCount: 6,
        itemBuilder: (context, index, animation) => SizeTransition(
          child: MyListItem(title: "item $index"),
          sizeFactor: animation.drive(Tween(begin: 0.0, end: 1.0)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          listKey.currentState.insertItem(4, duration: Duration(seconds: 1));
        },
      ),
    );
  }
}

class MyListItem extends StatelessWidget {
  final String title;

  const MyListItem({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
    );
  }
}
