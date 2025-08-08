import '../model/character.dart';

abstract interface class IRickAndMortyRepository {
  
Future<List<Character>> findAll({int? page});

}