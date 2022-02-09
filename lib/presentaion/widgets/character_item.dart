import 'dart:html';

import 'package:breackingbad/constance/strings.dart';
import 'package:flutter/material.dart';
import 'package:breackingbad/constance/my_colors.dart';
import 'package:breackingbad/data/models/characters.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWight,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: ()=>Navigator.pushNamed(context, charactersDetailsScreen,arguments: character),
        child: GridTile(
          child: Hero(
            tag: character.char_id,
            child: Container(
              color: MyColors.myGrey,
              child: FadeInImage.assetNetwork(
                width: double.infinity,
                height: double.infinity,
                placeholder: "assets/images/loading.gif",
                image: character.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          footer: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              character.name,
              style: const TextStyle(
                height: 1.3,
                fontSize: 16,
                color: MyColors.myWight,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
