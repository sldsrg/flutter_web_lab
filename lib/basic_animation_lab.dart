import 'package:flutter_for_web/material.dart';

class BasicAnimationLabPage extends StatefulWidget {
  @override
  _BasicAnimationLabPageState createState() => _BasicAnimationLabPageState();
}

class _BasicAnimationLabPageState extends State<BasicAnimationLabPage>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    _animation = CurvedAnimation(curve: Curves.easeIn, parent: _controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedLogo(animation: _animation),
      ),
    );
  }
}

class AnimatedLogo extends AnimatedWidget {
  static final _opacity_tween = Tween<double>(begin: 0.1, end: 1.0);
  static final _size_tween = Tween<double>(begin: 0.0, end: 300.0);

  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable;
    return Opacity(
        opacity: _opacity_tween.evaluate(animation),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          width: _size_tween.evaluate(animation),
          height: _size_tween.evaluate(animation),
          child: FlutterLogo(),
        ));
  }
}

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: FlutterLogo(),
    );
  }
}

class GrowTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  const GrowTransition({Key key, this.child, this.animation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      child: child,
      animation: animation,
      builder: (context, child) => Container(
        width: animation.value,
        height: animation.value,
        child: child,
      ),
    );
  }
}
