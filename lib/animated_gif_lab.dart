import 'package:flutter_web/material.dart';

class NextLabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var img = Image.asset('name');
    var stream = img.image.resolve(createLocalImageConfiguration(context))
    return Scaffold(
      appBar: AppBar(),
      body: Container(child: AnimatedFrames()),
    );
  }
}

class AnimatedFrames extends StatefulWidget {
  @override
  _AnimatedFramesState createState() => _AnimatedFramesState();
}

class _AnimatedFramesState extends State<AnimatedFrames>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<int> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900))
      ..repeat();
    _animation = IntTween(begin: 0, end: 29).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget child) {
        String frame = _animation.value.toString().padLeft(2, '0');
        return Image.asset(
          'images/frame_${frame}_delay-0.03s.gif',
          gaplessPlayback: true,
        );
      },
    );
  }
}
