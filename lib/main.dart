import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:korana/screens/introscreen.dart';
import 'package:korana/screens/worldstate.dart';

void main() {
  runApp(ProviderScope(child: corona()));
}

class corona extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: intro_screen(),
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
  }
}
