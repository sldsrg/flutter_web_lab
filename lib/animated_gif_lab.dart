import 'package:flutter/material.dart';

class AnimatedGifLabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Image.asset(
          'assets/images/double-ring-spinner.gif',
          gaplessPlayback: true,
        ),
      ),
    );
  }
}
