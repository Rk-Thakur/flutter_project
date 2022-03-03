import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:korana/api.dart';
import 'package:korana/models/corona_models.dart';
import 'package:korana/models/world_model.dart';

final worldProvider =
    StateNotifierProvider<WorldProvider, List<world>>((ref) => WorldProvider());

class WorldProvider extends StateNotifier<List<world>> {
  WorldProvider() : super([]) {
    getWorld();
  }
  Future<void> getWorld() async {
    final dio = Dio();
    try {
      final response = await dio.get('https://disease.sh/v3/covid-19/all');
      final data = (response.data as List).map((e) {
        return world.fromJson(e);
      }).toList();
      state = data;
    } on DioError catch (e) {
      print(e.error);
    }
  }
}
