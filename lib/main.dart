import 'package:corona/screens/countrieslist.dart';
import 'package:corona/screens/introscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
