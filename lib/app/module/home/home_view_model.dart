import 'package:flutter/material.dart';
import 'package:test_fteam_rick_and_morty/app/core/exception/repository_exception.dart';
import 'package:test_fteam_rick_and_morty/app/module/home/state/home_state.dart';
import 'package:test_fteam_rick_and_morty/app/usecase/find_character_usecase.dart';

class HomeViewModel extends ChangeNotifier {
  final FindCharacterUsecase _findCharacterUsecase;
  HomeState _homeState;
  HomeState get homeState => _homeState;

  HomeViewModel({required FindCharacterUsecase findCharacterUsecase})
      : _findCharacterUsecase = findCharacterUsecase,
        _homeState = HomeState.initial();

  Future<void> findAll() async {
    try {
      _homeState = _homeState.copyWith(status: HomeStateStatus.loading);
      notifyListeners();
      final characters = await _findCharacterUsecase();
      _homeState = _homeState.copyWith(
          status: HomeStateStatus.success, character: characters);
    } on RepositoryException catch (e) {
      _homeState = _homeState.copyWith(
        status: HomeStateStatus.success,
        errorMessage: () => e.message,
      );
    } finally {
      notifyListeners();
    }
  }
}
