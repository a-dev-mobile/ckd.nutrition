// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_dynamic_calls, parameter_assignments, lines_longer_than_80_chars, avoid_setters_without_getters
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_log/dio_log.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrition/core/services/dadata/dadata.dart';
import 'package:nutrition/global.dart';

final dadataServiceProvider = Provider<DaDataService>((ref) {
  return DaDataService(apiKey: DartDefine.API_KEY_DADATA)
    ..isShowHttpInLog = false;
});

class DaDataService {
  final String _apiKey;
  DaDataService({
    required String apiKey,
  })  : _apiKey = apiKey,
        _dio = Dio(
          BaseOptions(
            baseUrl: 'https://suggestions.dadata.ru',
            connectTimeout: 5000,
            receiveTimeout: 3000,
          ),
        )..interceptors.addAll([
            DioLogInterceptor(),
          ]);

  final Dio _dio;
  set isShowHttpInLog(bool value) => DioLogInterceptor.enablePrintLog = value;
  Future<List<SuggestionsFio>> fetchFioTooltip(
    String value,
    DaDataEnum type,
  ) async {
    final String typeFio;
    switch (type) {
      case DaDataEnum.name:
        typeFio = 'NAME';
        break;
      case DaDataEnum.patronymic:
        typeFio = 'PATRONYMIC';
        break;
      case DaDataEnum.surname:
        typeFio = 'SURNAME';
        break;
      case DaDataEnum.all:
        typeFio = '';
        break;
    }
    final response = await _dio.post(
      '/suggestions/api/4_1/rs/suggest/fio',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $_apiKey',
        },
      ),
      data: typeFio.isEmpty
          ? jsonEncode({
              'query': value,
            })
          : jsonEncode({
              'query': value,
              'parts': [typeFio],
            }),
    );

    return [];
  }
}
