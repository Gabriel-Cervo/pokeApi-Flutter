import 'package:flutter/material.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon.model.dart';
import 'package:pokeapi/src/features/pokemon/presentation/widgets/pokemon_type.widget.dart';
import 'package:pokeapi/src/shared/presentation/widget/cached_image.widget.dart';

class PokemonListTile extends StatelessWidget {
  final Pokemon pokemon;
  final Function()? onTap;

  const PokemonListTile({super.key, required this.pokemon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Theme.of(context).listTileTheme.tileColor),
          // height: 72,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Row(
              children: [
                CachedImageWidget(imageUrl: pokemon.sprites.frontDefault),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '#${pokemon.order}',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Text(
                      pokemon.name,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                const Spacer(),
                Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.end,
                  runSpacing: 4,
                  spacing: 4,
                  children: pokemon.types
                      .map((type) => PokemonTypeWidget(type: type.type.name))
                      .toList(),
                )
              ],
            ),
          )),
    );
  }
}
