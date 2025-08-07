import 'package:flutter/material.dart';
import 'package:test_fteam_rick_and_morty/app/core/dto/character_response_dto.dart';
    
class DetailsPage extends StatefulWidget {
  final CharacterDto char;
  const DetailsPage({super.key,required this.char});

  @override
  DetailsPageState createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final char = widget.char;
    return Scaffold(
      appBar: AppBar(
        title: Text(char.name),
      ),
      body: Container(
        child: Column(),
      ),
    );
  }
}