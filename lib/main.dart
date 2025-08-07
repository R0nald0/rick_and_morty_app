import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_fteam_rick_and_morty/app/app_module.dart';

import 'app/app_widget.dart';

void main() {
  runApp( ModularApp(module: AppModule(), child: AppWidget()));
}



