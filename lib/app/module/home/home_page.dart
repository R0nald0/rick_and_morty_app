import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_fteam_rick_and_morty/app/module/home/home_view_model.dart';
import 'package:test_fteam_rick_and_morty/app/module/home/state/home_state.dart';
import 'package:test_fteam_rick_and_morty/app/module/home/widget/card_character.dart';

class HomePage extends StatefulWidget {
  final HomeViewModel homeViewModel;
  const HomePage({super.key, required this.homeViewModel});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  Timer? debounceTimer;
  void _scrollTo() async {
    final direction = _scrollController.position.userScrollDirection;
    final HomeState(:status) = widget.homeViewModel.homeState;

    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 500 &&
        direction == ScrollDirection.reverse &&
        status != HomeStateStatus.loading) {
      debounceTimer?.cancel();
      debounceTimer = Timer(Duration(milliseconds: 300), () async {
        await widget.homeViewModel.findAll();
      });
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _scrollController.addListener(_scrollTo);
      widget.homeViewModel.addListener(() {
        final HomeViewModel(:homeState) = widget.homeViewModel;
        if (homeState.status == HomeStateStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              '${homeState.errorMessage}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ));
        }
      });
      await widget.homeViewModel.findAll();
    });
  }

  @override
  void dispose() {
    widget.homeViewModel.dispose();
    _scrollController.dispose();
    debounceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text("Characters"),
      ),
      body: LayoutBuilder(builder: (context, constraint) {
        return ListenableBuilder(
          listenable: Modular.get<HomeViewModel>(),
          builder: (context, child) {
            final HomeState(:character, :status, :errorMessage) =
                Modular.get<HomeViewModel>().homeState;
            return Stack(
              alignment: Alignment.center,
              children: [
                switch (Modular.get<HomeViewModel>().homeState.status) {
                  HomeStateStatus.initial => Center(
                      child: Text(
                        'Verificando dados',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  HomeStateStatus.error => Center(
                      child: Text(
                          'Não Conseguimos buscas dados dos personagemns',
                        textAlign: TextAlign.center,
                          ),
                    ),
                  _ => GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: constraint.maxWidth <= 600 ? 1 : 3),
                      controller: _scrollController,
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
                    ),
                },
                Offstage(
                  offstage: status != HomeStateStatus.loading,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                        height: MediaQuery.sizeOf(context).height * .1,
                        child: Center(child: CircularProgressIndicator())),
                  ),
                )
              ],
            );
          },
        );
      }),
    );
  }
}
