import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:quotify/screens/intro_screen.dart';
import 'package:quotify/screens/main_screen.dart';

void main() {
  runApp(ProviderScope(child: quotes()));
}

class quotes extends StatelessWidget {
  const quotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark(),
      home: intro_screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
