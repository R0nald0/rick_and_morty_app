
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_fteam_rick_and_morty/app/core/rest_client/rest_client.dart';
import 'package:test_fteam_rick_and_morty/app/module/home/home_module.dart';
import 'package:test_fteam_rick_and_morty/app/repository/impl/rick%20_and_morty_repository.dart';
import 'package:test_fteam_rick_and_morty/app/repository/rick_and_morty_repository.dart';
import 'package:test_fteam_rick_and_morty/app/usecase/find_character_usecase.dart';

import 'module/details/detail_module.dart';

class AppModule  extends Module{
  @override
  void binds(Injector i) {  
    super.binds(i);
    i.addLazySingleton(() => RestClient());
    i.addLazySingleton<IRickAndMortyRepository>(() => RickAndMortyRepository(restClinet: i()));
    i.addLazySingleton(() => FindCharacterUsecase(repository: i()));
  
  }
  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.module('/', module: HomeModule());
    r.module('/detail/', module: DetailModule());
  }
}