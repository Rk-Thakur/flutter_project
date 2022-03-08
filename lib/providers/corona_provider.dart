import 'package:corona/models/corona_models.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final coronaProvider = StateNotifierProvider<CoronaProvider, List<Countries>>(
    (ref) => CoronaProvider());

class CoronaProvider extends StateNotifier<List<Countries>> {
  CoronaProvider() : super([]) {
    getData();
  }
  Future<void> getData() async {
    final dio = Dio();
    try {
      final response =
          await dio.get('https://disease.sh/v3/covid-19/countries/');

      final data = (response.data as List).map((e) {
        return Countries.fromJson(e);
      }).toList();
      state = data;
    } on DioError catch (e) {
      print(e.error);
    }
  }

  Future<void> serchCountry(String countries) async {
    final dio = Dio();
    try {
      final response =
          await dio.get('https://disease.sh/v3/covid-19/countries/');

      final data = (response.data as List).map((e) {
        return Countries.fromJson(e);
      }).toList();
      state = data;
    } on DioError catch (e) {
      print(e.error);
    }
  }
}
