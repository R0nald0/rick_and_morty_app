import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_fteam_rick_and_morty/app/module/home/home_view_model.dart';
import 'package:test_fteam_rick_and_morty/app/module/home/state/home_state.dart';
import 'package:test_fteam_rick_and_morty/app/module/home/widget/card_character.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Modular.get<HomeViewModel>().findAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Characters"),
      ),
      body: ListenableBuilder(
          listenable: Modular.get<HomeViewModel>(),
          builder: (context, child) {
            final HomeState(:character, :status,:errorMessage) =
                Modular.get<HomeViewModel>().homeState;
            return switch (status) {
              HomeStateStatus.loading => Center(
                  child: CircularProgressIndicator(),
                ),
              HomeStateStatus.error => Center(
                  child: Text(errorMessage ?? 'Erro ao buscar dados'),
                ),
              
              HomeStateStatus.success => ListView.builder(
                  itemCount: character.length,
                  itemBuilder: (context, index) {
                    final char = character[index];
                    return CardCharacter(
                        characterDto: char,
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed('/detail', arguments: char);
                        });
                  },
                )
            };
          }),
    );
  }
}
