import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:breackingbad/data/models/characters.dart';
import 'package:breackingbad/data/repository/characters_reposotery.dart';
import 'package:breackingbad/data/models/quote.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<Character> characters = [];

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  static CharactersCubit go(context) => BlocProvider.of(context);

  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacter().then((characters) {
      this.characters = characters;
      emit(CharactersLoaded(characters));
    });

    return characters;
  }

  void getQuotes(String charName) {
    charactersRepository.getCharQuotes(charName).then((quotes) {
      emit(QuotesLoaded(quotes));
    });

  }
}
