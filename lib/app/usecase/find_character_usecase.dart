
import 'package:test_fteam_rick_and_morty/app/core/dto/character_response_dto.dart';
import 'package:test_fteam_rick_and_morty/app/repository/rick_and_morty_repository.dart';

class FindCharacterUsecase {
  final IRickAndMortyRepository _repository;

  FindCharacterUsecase({required IRickAndMortyRepository repository }):_repository = repository;

  Future<List<CharacterDto>> call() => _repository.findAll();

}