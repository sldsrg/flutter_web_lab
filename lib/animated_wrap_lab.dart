import 'package:collection/collection.dart';
import 'package:flutter_web/material.dart';

typedef AnimatedWrapItemBuilder = Widget Function(
    BuildContext context, int index, Animation<double> animation);

class AnimatedWrapLabPage extends StatefulWidget {
  @override
  _AnimatedWrapLabPageState createState() => _AnimatedWrapLabPageState();
}

class _AnimatedWrapLabPageState extends State<AnimatedWrapLabPage> {
  List<String> items;
  final wrapKey = GlobalKey<AnimatedWrapState>();

  @override
  void initState() {
    super.initState();
    items = <String>['Item One', 'Item Two', 'Item Three'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(8.0),
        color: Colors.teal[100],
        child: AnimatedWrap(
          key: wrapKey,
          initialItemCount: items.length,
          itemBuilder: (context, index, animation) {
            return SizeTransition(
              axis: Axis.horizontal,
              sizeFactor: animation.drive(Tween(begin: 0.0, end: 1.0)),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(items[index]),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one),
        onPressed: () {
          wrapKey.currentState.insertItem(1);
          setState(() {
            items.insert(1, 'Inserted element');
          });
        },
      ),
    );
  }
}

class _ActiveItem implements Comparable<_ActiveItem> {
  _ActiveItem.incoming(this.controller, this.itemIndex)
      : removedItemBuilder = null;
  _ActiveItem.outgoing(
      this.controller, this.itemIndex, this.removedItemBuilder);
  _ActiveItem.index(this.itemIndex)
      : controller = null,
        removedItemBuilder = null;

  final AnimationController controller;
  final AnimatedListRemovedItemBuilder removedItemBuilder;
  int itemIndex;

  @override
  int compareTo(_ActiveItem other) => itemIndex - other.itemIndex;
}

class AnimatedWrap extends StatefulWidget {
  final AnimatedWrapItemBuilder itemBuilder;
  final int initialItemCount;
  const AnimatedWrap({
    Key key,
    @required this.itemBuilder,
    this.initialItemCount,
  }) : super(key: key);

  @override
  AnimatedWrapState createState() => AnimatedWrapState();
}

class AnimatedWrapState extends State<AnimatedWrap>
    with TickerProviderStateMixin<AnimatedWrap> {
  final List<_ActiveItem> _incomingItems = <_ActiveItem>[];
  int _itemsCount = 0;

  @override
  void initState() {
    super.initState();
    _itemsCount = widget.initialItemCount;
  }

  @override
  void dispose() {
    for (var item in _incomingItems) {
      item.controller.dispose();
    }
    super.dispose();
  }

  _ActiveItem _removeActiveItemAt(List<_ActiveItem> items, int itemIndex) {
    final int i = binarySearch(items, _ActiveItem.index(itemIndex));
    return i == -1 ? null : items.removeAt(i);
  }

  _ActiveItem _activeItemAt(List<_ActiveItem> items, int itemIndex) {
    final int i = binarySearch(items, _ActiveItem.index(itemIndex));
    return i == -1 ? null : items[i];
  }

  void insertItem(int index) {
    assert(index != null && index >= 0);
    final int itemIndex = index;
    assert(itemIndex >= 0 && itemIndex <= _itemsCount);

    // Increment the incoming and outgoing item indices to account
    // for the insertion.
    for (var item in _incomingItems) {
      if (item.itemIndex >= itemIndex) {
        item.itemIndex += 1;
      }
    }

    final duration = Duration(milliseconds: 300);
    final AnimationController controller =
        AnimationController(duration: duration, vsync: this);
    final _ActiveItem incomingItem =
        _ActiveItem.incoming(controller, itemIndex);
    setState(() {
      _incomingItems
        ..add(incomingItem)
        ..sort();
      _itemsCount += 1;
    });

    controller.forward().then<void>((_) {
      _removeActiveItemAt(_incomingItems, incomingItem.itemIndex)
          .controller
          .dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      children: List.generate(_itemsCount, (itemIndex) {
        final _ActiveItem incomingItem =
            _activeItemAt(_incomingItems, itemIndex);
        final Animation<double> animation =
            incomingItem?.controller?.view ?? kAlwaysCompleteAnimation;

        return widget.itemBuilder(context, itemIndex, animation);
      }),
    );
  }
}
