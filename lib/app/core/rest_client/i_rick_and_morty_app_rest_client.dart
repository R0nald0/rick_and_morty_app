import 'package:test_fteam_rick_and_morty/app/core/dto/character_response_dto.dart';

abstract interface class IRickAndMortyAppRestClient {
  
  Future<List<CharacterDto>> getAll({int? page = 1});
}