import 'package:flutter/material.dart';

class ScreenMargin extends StatelessWidget {
  Widget child;
   ScreenMargin({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: child,
    );
  }
}
