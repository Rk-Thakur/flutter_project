import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:korana/models/world_model.dart';
import 'package:korana/providers/world_provider.dart';
import 'package:korana/screens/countrieslist.dart';
import 'package:korana/screens/detailscreen.dart';

class world_state extends StatelessWidget {
  const world_state({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, ref, child) {
        final worlds = ref.watch(worldProvider);
        return ListView.builder(
            itemCount: worlds.length,
            itemBuilder: (context, index) {
              final dats = worlds[index];
              return Column(
                children: [
                  Card(
                      child: Column(
                    children: [
                      reuserow(title: 'Cases', value: dats.cases),
                      reuserow(title: 'Deaths', value: dats.deaths),
                      reuserow(title: 'Today Cases', value: dats.todayCases),
                      reuserow(title: 'Updates', value: dats.updated),
                      reuserow(title: 'Cases', value: dats.cases),
                      reuserow(title: 'Deaths', value: dats.deaths),
                      reuserow(title: 'Today Cases', value: dats.todayCases),
                      reuserow(title: 'Updates', value: dats.updated),
                    ],
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    // onTap: () {
                    //   Get.to(() => countries_list(),
                    //       transition: Transition.cupertinoDialog);
                    // },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color(0xff1aa260),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text('Track Countries'),
                      ),
                    ),
                  ),
                ],
              );
            });
      }),
    );
  }
}
