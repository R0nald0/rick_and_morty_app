import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_fteam_rick_and_morty/app/module/home/home_view_model.dart';
import 'package:test_fteam_rick_and_morty/app/module/home/state/home_state.dart';
import 'package:test_fteam_rick_and_morty/app/core/widget/card_character.dart';

import '../../core/widget/rick_and_mort_app_loading.dart';

class HomePage extends StatefulWidget {
  final HomeViewModel homeViewModel;
  const HomePage({super.key, required this.homeViewModel});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  Timer? _debounceTimer;
  void _infinitScroll() async {
    final direction = _scrollController.position.userScrollDirection;
    final HomeState(:status) = widget.homeViewModel.homeState;

    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 800 &&
        direction == ScrollDirection.reverse &&
        status != HomeStateStatus.loading) {
      _debounceTimer?.cancel();
      _debounceTimer = Timer(Duration(milliseconds: 300), () async {
        await widget.homeViewModel.findAll();
      });
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _scrollController.addListener(_infinitScroll);
       showMessage();

      await widget.homeViewModel.findAll();
    });
  }

  void showMessage() {
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
    
  }

  @override
  void dispose() {
    widget.homeViewModel.dispose();
    _scrollController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Characters"),
      ),
      body: LayoutBuilder(builder: (context, constraint) {
        return ListenableBuilder(
          listenable: Modular.get<HomeViewModel>(),
          builder: (context, child) {
            final HomeState(characters:character, :status, :errorMessage) =
                Modular.get<HomeViewModel>().homeState;
            return Stack(
              alignment: Alignment.center,
              children: [
                switch (Modular.get<HomeViewModel>().homeState.status) {
                  HomeStateStatus.initial => Center(
                      child: Text(
                        'Buscando dados...',
                        style: Theme.of(context).textTheme.bodyMedium,
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
                            character: char,
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed('/detail/', arguments: char);
                            });
                      },
                    ),
                },
                
                RickAndMortyAppLoading(isLoading: status != HomeStateStatus.loading,)
              ],
            );
          },
        );
      }),
    );
  }
}


