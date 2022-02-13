import 'package:breackingbad/constance/my_colors.dart';
import 'package:breackingbad/data/models/characters.dart';
import 'package:flutter/cupertino.dart';
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
            style: const TextStyle(
              color: MyColors.myWight,
            ),
            textAlign: TextAlign.start,
          ),
          background: Hero(
            tag: character.char_id,
            child: Image.network(
              character.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }

    Widget characterInfo(String title, String value) {
      return RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: MyColors.myWight,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: MyColors.myWight,
              fontSize: 16,
            ),
          ),
        ]),
      );
    }

    Widget buildDivider(double endIndent) {
      return Divider(
        height: 30,
        endIndent: endIndent,
        thickness: 2,
        color: MyColors.myYellow,
      );
    }

    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppbar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo('Job : ', character.jobs.join(' / ')),
                      buildDivider(315),
                      characterInfo(
                          'Appeared in : ', character.categoryForTowsearies),
                      buildDivider(250),
                      characterInfo('seasons : ',
                          character.aprepenceOffSeasons.join(' / ')),
                      buildDivider(280),
                      characterInfo('status : ', character.statusIfDeadorAlive),
                      buildDivider(300),
                      character.better_call_saul_appearance.isEmpty
                          ? Container()
                          : characterInfo('Better Call Saul seasons : ',
                              character.better_call_saul_appearance.join('/')),
                      character.better_call_saul_appearance.isEmpty
                          ? Container()
                          : buildDivider(150),
                      characterInfo('Actor/Actress : ', character.actorName),
                      buildDivider(240),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                const   SizedBox(
                  height: 500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
