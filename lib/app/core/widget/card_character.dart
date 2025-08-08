import 'package:flutter/material.dart';
import 'package:test_fteam_rick_and_morty/app/model/character.dart';

class CardCharacter extends StatelessWidget {
  final Character character;
  final VoidCallback onTap;
  const CardCharacter({super.key, required this.character ,required this.onTap});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
         color: Colors.amber,
        child: Card(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        ),
          color: Colors.blue,
          elevation: 10,
          child: Column(
            spacing: 10,
            children: [
              Expanded(
                  child: Image.network(character.image,
                  width: MediaQuery.sizeOf(context).width ,
                 fit: BoxFit.cover,
              )),
              Padding(
                padding: EdgeInsets.all(8),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Text( 
                    character.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
