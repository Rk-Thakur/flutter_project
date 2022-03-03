import 'package:flutter/material.dart';

class checkscreen extends StatefulWidget {
  late String name;
  checkscreen({required this.name});
  @override
  _checkscreenState createState() => _checkscreenState();
}

class _checkscreenState extends State<checkscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          Text(widget.name),
        ],
      ),
    );
  }
}
