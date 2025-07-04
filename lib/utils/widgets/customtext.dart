import 'package:flutter/material.dart';

class Customtext extends StatelessWidget {
  final String text;

   Customtext({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
