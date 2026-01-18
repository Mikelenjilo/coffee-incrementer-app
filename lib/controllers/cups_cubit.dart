import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CupsCubit extends Cubit<int> {
  final Dio _dio;
  final String baseUrl;
  final String apiKey;

  CupsCubit({
    required this.baseUrl,
    required this.apiKey,
    Dio? dio,
  })  : _dio = dio ?? Dio(),
        super(0);

  Future<int> incrementCoffee(int amount) async {
    try {
      final response = await _dio.post(
        '$baseUrl/api/coffee',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'x-api-key': apiKey,
          },
        ),
        data: {'increment': amount},
      );

      if (response.statusCode == 200) {
        final count = response.data['count'];
        emit(count);
        return count;
      }
      throw Exception('Failed to increment coffee count');
    } catch (e) {
      throw Exception('Failed to increment coffee count: $e');
    }
  }
}
