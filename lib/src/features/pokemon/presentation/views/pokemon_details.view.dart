import 'package:flutter/material.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon.model.dart';
import 'package:pokeapi/src/shared/presentation/widget/base_screen.widget.dart';

class PokemonDetailsView extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailsView({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(child: SizedBox());
  }
}
