import 'package:breackingbad/data/models/characters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breackingbad/business_logic/cubit/characters_cubit.dart';
import 'package:breackingbad/data/repository/characters_reposotery.dart';
import 'package:breackingbad/presentaion/screens/charachters_screen.dart';
import 'constance/strings.dart';
import 'data/web_services/characters_webservices.dart';
import 'presentaion/screens/characters_details_screen.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: CharactersScreen(),
          ),
        );
      case charactersDetailsScreen:
        final character = routeSettings.arguments as Character;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => CharactersCubit(charactersRepository),
                  child: CharactersDetailsScreen(character: character),
                ));
    }
  }
}
