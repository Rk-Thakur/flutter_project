import 'package:corona/models/world_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final worldProvider =
    StateNotifierProvider<WorldProvider, world>((ref) => WorldProvider());

class WorldProvider extends StateNotifier<world> {
  WorldProvider()
      : super(world(
            updated: '0.0', cases: "0.0", todayCases: "0.0", deaths: "0.0"));

  Future<world> getWorld() async {
    final dio = Dio();
    try {
      final response = await dio.get('https://disease.sh/v3/covid-19/all');
      final data = world.fromJson(response.data);
      print(response.data);

      return data;
    } on DioError catch (e) {
      throw e;
    }
  }
}
