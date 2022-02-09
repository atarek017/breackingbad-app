import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breackingbad/business_logic/cubit/characters_cubit.dart';
import 'package:breackingbad/constance/my_colors.dart';
import 'package:breackingbad/data/models/characters.dart';
import 'package:breackingbad/presentaion/widgets/character_item.dart';

class CharactersScreen extends StatefulWidget {
  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> allCharacters;
  late List<Character> searchedForCharacters;
  bool _isSearching = false;
  final _searchTexController = TextEditingController();

  @override
  void initState() {
    CharactersCubit.go(context).getAllCharacters();
    super.initState();
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchTexController,
      cursorColor: MyColors.myGrey,
      decoration: const InputDecoration(
        hintText: 'find a character',
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: MyColors.myGrey,
          fontSize: 18,
        ),
      ),
      style: const TextStyle(
        color: MyColors.myGrey,
        fontSize: 18,
      ),
      onChanged: (searchedCharacter) {
        searchedForCharacters = allCharacters
            .where((character) =>
                character.name.toLowerCase().startsWith(searchedCharacter))
            .toList();

        setState(() {});
      },
    );
  }

  Widget buildBlocWidget() {
    return BlocConsumer<CharactersCubit, CharactersState>(
        listener: (context, CharactersState statue) {
      print(statue);
    }, builder: (context, state) {
      if (state is CharactersLoaded) {
        allCharacters = state.characters;

        return buildLoadedListWidgets();
      } else {
        return showLoadingIndecator();
      }
    });
  }

  Widget showLoadingIndecator() {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [
            buildCharacterList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharacterList() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const ClampingScrollPhysics(),
        itemCount:_searchTexController.text.isEmpty? allCharacters.length: searchedForCharacters.length,
        itemBuilder: (context, index) {
          return CharacterItem(
            character: _searchTexController.text.isEmpty? allCharacters[index]: searchedForCharacters[index] ,
          );
        });
  }

  Widget appBarTitle() {
    return const Text(
      "Characters",
      style: TextStyle(color: MyColors.myGrey),
    );
  }

  void _startSearch() {
    ModalRoute.of(context)
        ?.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    setState(() {
      _searchTexController.clear();
      _isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: _isSearching
            ? [
                IconButton(
                    onPressed: () {
                      _stopSearching();
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.clear,
                      color: MyColors.myGrey,
                    )),
              ]
            : [
                IconButton(
                    onPressed: _startSearch,
                    icon: const Icon(
                      Icons.search,
                      color: MyColors.myGrey,
                    ))
              ],
        backgroundColor: MyColors.myYellow,
        title: _isSearching ? _buildSearchField() : appBarTitle(),
        leading: _isSearching? BackButton(color: MyColors.myGrey,):SizedBox.shrink(),
      ),
      body: buildBlocWidget(),
    );
  }
}
