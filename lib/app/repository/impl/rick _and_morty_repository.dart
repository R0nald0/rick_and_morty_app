

import 'dart:developer';

import 'package:test_fteam_rick_and_morty/app/core/dto/character_response_dto.dart';
import 'package:test_fteam_rick_and_morty/app/core/exception/rest_client_exception.dart';
import 'package:test_fteam_rick_and_morty/app/repository/rick_and_morty_repository.dart';

import '../../core/exception/repository_exception.dart';
import '../../core/rest_client/rest_client.dart';

class RickAndMortyRepository implements IRickAndMortyRepository {
  final RestClient _restClient;

  RickAndMortyRepository({required RestClient restClinet})
      : _restClient = restClinet;

  @override
  Future<List<CharacterDto>> findAll({int? page}) async {
    try {
      return _restClient.getAll(page: page);
    } on RestClientException catch(e,s) {
       log(e.message, error: e,stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar dados');
    }
  }
}
