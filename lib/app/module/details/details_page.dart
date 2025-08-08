import 'package:flutter/material.dart';
import 'package:test_fteam_rick_and_morty/app/core/dto/character_response_dto.dart';

class DetailsPage extends StatefulWidget {
  final CharacterDto char;
  const DetailsPage({super.key, required this.char});

  @override
  DetailsPageState createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final char = widget.char;
    final radiusContainer =  Radius.circular(20);
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Character'),
          centerTitle: true,
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                char.image,
                fit: BoxFit.fill,
                height: 20,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight *.25,
                  padding: EdgeInsets.all(2),
                  decoration:
                      BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft:radiusContainer,
                          topRight: radiusContainer
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                          Colors.black.withAlpha(180),
                          Colors.grey.withAlpha(180),
                        ])
                        ),
                  child: Column(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          char.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          char.species,
                          maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyMedium ,
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          char.status,
                          maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyMedium),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        }));
  }
}
