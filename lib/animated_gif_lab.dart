import 'package:flutter_for_web/material.dart';

class AnimatedGifLabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Image.asset(
          'double-ring-spinner.gif',
          gaplessPlayback: true,
        ),
      ),
    );
  }
}
