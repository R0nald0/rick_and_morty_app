import 'dart:developer';
import 'package:test_fteam_rick_and_morty/app/core/constants/app_constants.dart';
import 'package:test_fteam_rick_and_morty/app/core/exception/rest_client_exception.dart';
import 'package:test_fteam_rick_and_morty/app/core/extension/characater_extension.dart';
import 'package:test_fteam_rick_and_morty/app/core/rest_client/i_rick_and_morty_app_rest_client.dart';
import 'package:test_fteam_rick_and_morty/app/model/character.dart';
import 'package:test_fteam_rick_and_morty/app/repository/i_rick_and_morty_repository.dart';
import '../../core/exception/repository_exception.dart';

class RickAndMortyRepository implements IRickAndMortyRepository {
  final IRickAndMortyAppRestClient _restClient;

  RickAndMortyRepository({required IRickAndMortyAppRestClient restClinet})
      : _restClient = restClinet;

  @override
  Future<List<Character>> findAll({int? page}) async {
    try {
      if (page != null && page > AppConstants.TOTAL_PAGES) {
         throw RepositoryException(message: 'Sem novos personagens na lista');
      }
     final resultDto  = await _restClient.getAll(page: page);
     return resultDto.map<Character>((dto)=> dto.toCharacterDomain() ).toList();
    } on RestClientException catch(e,s) {
       log(e.message, error: e,stackTrace: s);
      throw RepositoryException(message: e.message);
    }
  }
}
