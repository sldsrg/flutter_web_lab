import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ListenableLabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Model();
    return Scaffold(
      body: Center(
        child: Trigger(model.full),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.skip_next),
        onPressed: () {
          model.next();
        },
      ),
    );
  }
}

class Model {
  final full = ValueNotifier<bool>(false);
  final current = ValueNotifier<int>(1);

  void next() {
    current.value++;
    if (current.value > 5) full.value = true;
    print('${current.value} is ${full.value ? "full" : "filling"}');
  }
}

class Trigger extends StatelessWidget {
  final ValueListenable<bool> full;
  Trigger(this.full);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      builder: (context, value, child) => Container(
        width: 100,
        height: 100,
        color: value ? Colors.red : Colors.green,
      ),
      valueListenable: full,
    );
  }
}
