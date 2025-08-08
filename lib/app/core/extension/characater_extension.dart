import 'package:test_fteam_rick_and_morty/app/core/dto/character_response_dto.dart';
import 'package:test_fteam_rick_and_morty/app/model/character.dart';

extension  CharacterMapper on CharacterDto {
  Character toCharacterDomain(){
    return Character(name: name, species: species, status: status, image: image);
  }
}