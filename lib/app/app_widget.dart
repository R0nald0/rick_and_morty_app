import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_fteam_rick_and_morty/app/core/themeapp/rick_and_morty_app.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

 @override
  Widget build(BuildContext context){
    
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Rick And Mory',
      theme: RickAndMortyAppTheme.theme,
      routerConfig: Modular.routerConfig,
    ); 
  }
}