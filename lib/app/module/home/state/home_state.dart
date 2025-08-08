

import 'package:flutter/widgets.dart';

import 'package:test_fteam_rick_and_morty/app/core/dto/character_response_dto.dart';

enum HomeStateStatus{
  initial,loading,error,success
}
class HomeState {
   final List<CharacterDto> character;
    final HomeStateStatus status;
    final String? errorMessage;
    
  HomeState({
    this.errorMessage,
    required this.character,
    required this.status
  });
    
  HomeState.initial():this(character: [],status: HomeStateStatus.initial);


  HomeState copyWith({
    List<CharacterDto>? character,
    HomeStateStatus? status,
    ValueGetter<String?>? errorMessage,
  }) {
    return HomeState(
      character: character ?? this.character,
      status: status ?? this.status,
      errorMessage: errorMessage != null ? errorMessage() : this.errorMessage,
    );
  }
}
