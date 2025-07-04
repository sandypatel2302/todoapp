import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  final String text;
  final VoidCallback voidCallback;

  Custombutton({required this.text, required this.voidCallback});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(10),
      color: Colors.blueAccent,
      onPressed: voidCallback,
      child: Text(text, style: TextStyle(color: Colors.white)),
    );
  }
}
