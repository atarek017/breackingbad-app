import 'package:breackingbad/data/models/characters.dart';
import 'package:breackingbad/data/web_services/characters_webservices.dart';

class CharactersRepository {
  final CharactersWebServices charactersWebServices;

  CharactersRepository(this.charactersWebServices);

  Future<List<Character>> getAllCharacter() async {
    final characters = await charactersWebServices.getAllCharacter();

    return characters.map((character) => Character.formJson(character)).toList();
  }
}
