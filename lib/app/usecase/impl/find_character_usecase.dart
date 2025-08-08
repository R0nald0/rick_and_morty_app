
import 'package:test_fteam_rick_and_morty/app/model/character.dart';
import 'package:test_fteam_rick_and_morty/app/repository/i_rick_and_morty_repository.dart';
import 'package:test_fteam_rick_and_morty/app/usecase/i_find_character_usecase.dart';

class FindCharacterUseCase implements IFindCharacterUseCase {
  final IRickAndMortyRepository _repository;

  FindCharacterUseCase({required IRickAndMortyRepository repository }):_repository = repository;
   
  @override 
  Future<List<Character>> call({int? page}) => _repository.findAll(page: page);

}