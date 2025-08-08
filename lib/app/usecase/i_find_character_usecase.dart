
import 'package:test_fteam_rick_and_morty/app/model/character.dart';

abstract interface class IFindCharacterUseCase {
  
  Future<List<Character>> call({int? page});
}