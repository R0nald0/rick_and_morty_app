import 'package:flutter/material.dart';
import 'package:test_fteam_rick_and_morty/app/model/character.dart';

class DetailsPage extends StatefulWidget {
  final Character char;
  const DetailsPage({super.key, required this.char});

  @override
  DetailsPageState createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final char = widget.char;
    final radiusContainer = Radius.circular(20);
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
                  height: constraints.maxHeight * .25,
                  padding: EdgeInsets.symmetric(vertical: 20,horizontal: 7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: radiusContainer, topRight: radiusContainer),
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withAlpha(180),
                            Colors.grey.withAlpha(180),
                          ])),
                  child: CharacterInfo(char: char, theme: theme),
                ),
              )
            ],
          );
        }));
  }
}

class CharacterInfo extends StatelessWidget {
  const CharacterInfo({
    super.key,
    required this.char,
    required this.theme,
  });

  final Character char;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              style: theme.textTheme.bodyMedium,
            ),
          ),
          FittedBox(
            fit: BoxFit.cover,
            child: Text(
              char.species,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium,
            ),
          ),
          FittedBox(
            fit: BoxFit.cover,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 3,
              children: [
                Text(char.status,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium),
                    switch(char.status) {
                        'Alive' => Icon(Icons.circle,color:Colors.green,size: 13,),  
                        'Dead' => Icon(Icons.circle,color: Colors.grey,size: 13,) , 
                        'unknown'   => Icon(Icons.question_mark,color: Colors.blueGrey,size: 13,),
                        _ => Icon(Icons.device_unknown, color:Colors.blueGrey,size: 13)   
                     }
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
