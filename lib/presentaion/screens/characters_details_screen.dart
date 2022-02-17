import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:breackingbad/business_logic/cubit/characters_cubit.dart';
import 'package:breackingbad/constance/my_colors.dart';
import 'package:breackingbad/data/models/characters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersDetailsScreen extends StatelessWidget {
  final Character character;

  const CharactersDetailsScreen({Key? key, required this.character})
      : super(key: key);


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

  Widget displayRandomQouteOrEmptySpace( state){
    var quotes= (state).quotes;
    if(quotes.lenght !=0){
      int randomQuoteIndex=Random().nextInt(quotes.lenght -1);
      return Center(
        child: DefaultTextStyle(
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 20,
              color: MyColors.myWight,
              shadows: [
                Shadow(
                  blurRadius: 7,
                  color: MyColors.myYellow,
                  offset: Offset(0,0),
                )
              ]
          ),
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              FlickerAnimatedText(quotes[randomQuoteIndex].quote),
            ],
          ),
        ),

      );
    }else{
      return Container();
    }

  }

  Widget showProgressIndicator(){
    return Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }

  Widget checkIfQuotesAreLoaded(CharactersState state) {
    if (state is QuotesLoaded) {
      return displayRandomQouteOrEmptySpace(state);
    }else{
      return showProgressIndicator();
    }
  }


  @override
  Widget build(BuildContext context) {

    BlocProvider.of<CharactersCubit>(context).getQuotes(character.name);


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
                      BlocBuilder<CharactersCubit, CharactersState>(
                        builder: (context, state) {
                          return checkIfQuotesAreLoaded(state);
                        },),
                    ],
                  ),
                ),
                const SizedBox(
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
