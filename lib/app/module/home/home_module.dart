
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_fteam_rick_and_morty/app/module/home/home_page.dart';
import 'package:test_fteam_rick_and_morty/app/module/home/home_view_model.dart';

class HomeModule extends Module{
  @override
  void binds(Injector i) {
    super.binds(i);
    i.addSingleton(() => HomeViewModel(findCharacterUsecase: Modular.get()));
  }
  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child('/', child:(context) => HomePage());
  }
}