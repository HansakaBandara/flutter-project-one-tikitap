import 'package:flutter/material.dart';

class Tiki extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 36,
      child: Image.asset(
          'lib/Images/tiki.png'
      ),
    );
  }
}