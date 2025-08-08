import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:test_fteam_rick_and_morty/app/core/constants/app_constants.dart';
import 'package:test_fteam_rick_and_morty/app/core/dto/character_response_dto.dart';
import 'package:test_fteam_rick_and_morty/app/core/exception/rest_client_exception.dart';

class RestClient {
  late Dio _dio;

  RestClient() {
    _dio = Dio(BaseOptions(
      baseUrl: AppConstants.BASE_URL,
      connectTimeout: Duration(seconds: 60),
      receiveTimeout: Duration(seconds: 60),
    ))..interceptors.addAll(
    [ LogInterceptor(
      requestBody: true,
      responseBody: true
    )]
    );
  }

  Future<List<CharacterDto>> getAll({int? page = 1}) async {
    try {
     
      final Response(:data) = await _dio.get('character',queryParameters: {
        'page':page
      });
      final results = data['results'] as List;

      return results
          .map<CharacterDto>((char) => CharacterDto.fromMap(char))
          .toList();
    } on DioException catch (e, s) {
      const message  = 'Erro ao buscar personagems';
       log(message, error: e,stackTrace: s);
       throw RestClientException(message: message);
    }
     on ArgumentError catch (e, s) {
      const message  = 'Json inválido';
       log(message, error: e,stackTrace: s);
       throw RestClientException(message: message);
    }

  }
}
