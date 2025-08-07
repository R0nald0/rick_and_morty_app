import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_fteam_rick_and_morty/app/module/details/details_page.dart';

class DetailModule extends Module {
    @override
  void binds(Injector i) {
    // TODO: implement binds
    super.binds(i);
  }
  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child('/', child: (context) => DetailsPage(char: r.args.data,));
  }
}