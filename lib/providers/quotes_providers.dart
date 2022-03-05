import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotify/models/quotes_models.dart';

final quoteProvider = StateNotifierProvider<QuotesProvider, List<Quotes>>(
    (ref) => QuotesProvider());

class QuotesProvider extends StateNotifier<List<Quotes>> {
  QuotesProvider() : super([]) {
    getData();
  }
  Future<void> getData() async {
    final dio = Dio();
    try {
      final response =
          await dio.get('https://famous-quotes4.p.rapidapi.com/random',
              queryParameters: {'category': 'all', 'count': '1000'},
              options: Options(headers: {
                'x-rapidapi-host': 'famous-quotes4.p.rapidapi.com',
                'x-rapidapi-key':
                    'e7db4f58a9msh38c61008b84e869p1960f1jsn61164c8d1a95'
              }));
      final data = (response.data as List).map((e) {
        return Quotes.fromJson(e);
      }).toList();
      // print(response.data);

      state = data;
    } on DioError catch (e) {
      print(e.error);
    }
  }

  Future<void> getSearch(String query) async {
    final dio = Dio();
    try {
      final response =
          await dio.get('https://famous-quotes4.p.rapidapi.com/random',
              queryParameters: {'category': query, 'count': '1000'},
              options: Options(headers: {
                'x-rapidapi-host': 'famous-quotes4.p.rapidapi.com',
                'x-rapidapi-key':
                    'e7db4f58a9msh38c61008b84e869p1960f1jsn61164c8d1a95'
              }));

      final data = (response.data as List).map((e) {
        return Quotes.fromJson(e);
      }).toList();

      state = data;
    } on DioError catch (e) {
      print(e.error);
    }
  }
}
