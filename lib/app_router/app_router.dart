import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breaking/Blocs/characters_cubit.dart';
import 'package:flutter_breaking/data/Models/characters.dart';
import 'package:flutter_breaking/data/Repositories/characters_repository.dart';
import 'package:flutter_breaking/data/services/characters_web_services.dart';
import 'package:flutter_breaking/presentation/screens/character_detailsScreen.dart';
import 'package:flutter_breaking/presentation/screens/character_screen.dart';

// case'/' slash here represents home page
//builder in Materialpageroute builds screens
class AppRouter {
  late CharacterRepository characterRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    characterRepository = CharacterRepository(CharacterWebService());
    charactersCubit = CharactersCubit(characterRepository);
  }

  Route ? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case"/":
        return MaterialPageRoute(
            builder: (_) =>
                BlocProvider(
                  create: (BuildContext context) =>
                  charactersCubit,
                  child: CharacterScreen(),

                ));
      case'CharacterDetailsScreen':
        final character = settings.arguments as Character;
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              child: CharacterDetailsScreen(character: character),
            ));
    };
  }

}