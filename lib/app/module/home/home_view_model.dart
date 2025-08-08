import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_fteam_rick_and_morty/app/core/exception/repository_exception.dart';
import 'package:test_fteam_rick_and_morty/app/module/home/state/home_state.dart';
import 'package:test_fteam_rick_and_morty/app/usecase/find_character_usecase.dart';

class HomeViewModel extends ChangeNotifier {
  final FindCharacterUsecase _findCharacterUsecase;
  HomeState _homeState;
  HomeState get homeState => _homeState;
  int _page = 0;

  HomeViewModel({required FindCharacterUsecase findCharacterUsecase})
      : _findCharacterUsecase = findCharacterUsecase,
        _homeState = HomeState.initial();

  Future<void> findAll() async {
    try {
      _homeState = _homeState.copyWith(status: HomeStateStatus.loading);
      notifyListeners();
      _page++;
  
      final characters = await _findCharacterUsecase(page: _page);
      final charactersUpdated = [..._homeState.character, ...characters];
      
      _homeState = _homeState.copyWith(
          status: HomeStateStatus.success, character: charactersUpdated);
      log('size : ${charactersUpdated.length}'); 
    } on RepositoryException catch (e) {
      _homeState = _homeState.copyWith(
        status: HomeStateStatus.error,
        errorMessage: () => e.message,
      );

    } finally {
      notifyListeners();
    }
  }
}
