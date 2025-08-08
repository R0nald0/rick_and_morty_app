import 'package:flutter/material.dart';

class RickAndMortyAppLoading extends StatelessWidget {
  final bool isLoading;
   
  const RickAndMortyAppLoading({
    super.key,
    required this.isLoading,
  });


  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: isLoading,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withAlpha(180),
                    Colors.grey.withAlpha(180),
                  ])),
          child: SizedBox(
              height: MediaQuery.sizeOf(context).height * .1,
              child: Center(child: CircularProgressIndicator(strokeWidth: 2,semanticsLabel: 'Carregando',strokeCap: StrokeCap.butt,))),
        ),
      ),
    );
  }
}
