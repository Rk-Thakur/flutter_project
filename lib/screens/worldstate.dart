import 'package:corona/providers/world_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class world_state extends StatefulWidget {
  const world_state({Key? key}) : super(key: key);

  @override
  State<world_state> createState() => _world_stateState();
}

class _world_stateState extends State<world_state> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, ref, child) {
        final worlds = ref.watch(worldProvider);
        return Card(
          child: Column(
            children: [
              Text(worlds.cases),
              Text(worlds.deaths),
              Text(worlds.todayCases),
              Text(worlds.updated),
            ],
          ),
        );
      }),
    );
  }
}
