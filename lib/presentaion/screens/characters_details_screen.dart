import 'package:breackingbad/constance/my_colors.dart';
import 'package:breackingbad/data/models/characters.dart';
import 'package:flutter/material.dart';

class CharactersDetailsScreen extends StatelessWidget {
  final Character character;

  const CharactersDetailsScreen({Key? key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildSliverAppbar() {
      return SliverAppBar(
        expandedHeight: 600,
        pinned: true,
        stretch: true,
        backgroundColor: MyColors.myGrey,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text(
            character.nickname,
            style:const TextStyle(
              color: MyColors.myWight,
            ),
            textAlign: TextAlign.start,
          ),
          background: Hero(
            tag: character.char_id,
            child: Image,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppbar(),
        ],
      ),
    );
  }
}
