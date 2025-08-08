
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_fteam_rick_and_morty/app/core/rest_client/i_rick_and_morty_app_rest_client.dart';
import 'package:test_fteam_rick_and_morty/app/core/rest_client/impl/rest_client.dart';
import 'package:test_fteam_rick_and_morty/app/module/home/home_module.dart';
import 'package:test_fteam_rick_and_morty/app/repository/i_rick_and_morty_repository.dart';
import 'package:test_fteam_rick_and_morty/app/repository/impl/rick_and_morty_repository.dart';
import 'package:test_fteam_rick_and_morty/app/usecase/i_find_character_usecase.dart';
import 'package:test_fteam_rick_and_morty/app/usecase/impl/find_character_usecase.dart';

class AppModule  extends Module{
  @override
  void binds(Injector i) {  
    super.binds(i);
    i.addLazySingleton<IRickAndMortyAppRestClient>(() => RestClient());
    i.addLazySingleton<IRickAndMortyRepository>(() => RickAndMortyRepository(restClinet: i()));
    i.addLazySingleton<IFindCharacterUseCase>(() => FindCharacterUseCase(repository: i()));
  
  }
  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.module('/', module: HomeModule());
   
  }
}