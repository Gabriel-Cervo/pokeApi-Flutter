import 'package:flutter/material.dart';
import 'package:pokeapi/src/core/network/network_service.dart';
import 'package:pokeapi/src/core/utils/injector.dart';
import 'package:pokeapi/src/core/utils/logs/logger.dart';
import 'package:pokeapi/src/features/pokemon/presentation/views/pokemon_list.view.dart';

void main() {
  initRootLogger();
  DioNetwork.initDio();
  injector.injectDependencies();
  runApp(const Pokedex());
}

class Pokedex extends StatelessWidget {
  const Pokedex({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Pokedex',
      home: PokemonListView(),
    );
  }
}
