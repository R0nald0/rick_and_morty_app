

import 'package:flutter/widgets.dart';
import 'package:test_fteam_rick_and_morty/app/model/character.dart';

enum HomeStateStatus{
  initial,loading,error,success
}
class HomeState {
   final List<Character> characters;
    final HomeStateStatus status;
    final String? errorMessage;
    
  HomeState({
    this.errorMessage,
    required this.characters,
    required this.status
  });
    
  HomeState.initial():this(characters: [],status: HomeStateStatus.initial);


  HomeState copyWith({
    List<Character>? characters,
    HomeStateStatus? status,
    ValueGetter<String?>? errorMessage,
  }) {
    return HomeState(
      characters: characters ?? this.characters,
      status: status ?? this.status,
      errorMessage: errorMessage != null ? errorMessage() : this.errorMessage,
    );
  }
}
