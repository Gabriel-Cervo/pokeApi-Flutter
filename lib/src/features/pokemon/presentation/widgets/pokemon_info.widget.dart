import 'package:flutter/material.dart';
import 'package:pokeapi/src/core/helpers/flavor_cleaner.helper.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon.model.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon_specie.model.dart';
import 'package:pokeapi/src/features/pokemon/presentation/widgets/pokemon_type.widget.dart';

class PokemonInfoWidget extends StatelessWidget {
  final Pokemon pokemon;
  final PokemonSpecie specie;
  const PokemonInfoWidget(
      {super.key, required this.pokemon, required this.specie});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _renderTopSection(context),
          _renderDividerWithPadding(),
          _renderOverallSection(context),
          _renderDividerWithPadding(),
          _renderBaseStatsSection(context)
        ],
      ),
    );
  }

  Widget _renderTopSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '#${pokemon.id}',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              pokemon.name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
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
        const SizedBox(
          height: 16,
        ),
        Text(
          FlavorCleaner.clean(specie.flavorTextEntries
              .firstWhere((e) => e.language.name == 'en')
              .flavorText),
          style: Theme.of(context).textTheme.displayMedium,
        )
      ],
    );
  }

  Widget _renderDividerWithPadding() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 24.0),
      child: Divider(),
    );
  }

  Widget _renderOverallSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _renderTitleWithPadding(context, "Overall"),
        Wrap(
          runSpacing: 16,
          children: [
            _renderKeyValueTextRow(context, 'Height', '${pokemon.height}'),
            _renderKeyValueTextRow(context, 'Weight', '${pokemon.weight}'),
            _renderKeyValueTextRow(context, 'Abilities',
                pokemon.abilities.map((a) => a.ability.name).join(', ')),
            _renderGenderInfo(context)
          ],
        ),
      ],
    );
  }

  Widget _renderBaseStatsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _renderTitleWithPadding(context, "Base stats"),
        GridView.count(
          padding: EdgeInsets.zero,
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          childAspectRatio: 5,
          children: pokemon.stats
              .map((s) => SizedBox(
                  height: 18,
                  child: _renderKeyValueTextRow(
                      context, s.stat.name, '${s.baseStat}')))
              .toList(),
        )
      ],
    );
  }

  Widget _renderKeyValueTextRow(
      BuildContext context, String key, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          fit: FlexFit.loose,
          child: Text(
            key,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Flexible(
          fit: FlexFit.loose,
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }

  Widget _renderTitleWithPadding(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }

  Widget _renderGenderInfo(BuildContext context) {
    final femalePercentage = (specie.genderRate / 8) * 100;
    final malePercentage = 100 - femalePercentage;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          fit: FlexFit.loose,
          child: Text(
            "Gender",
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Row(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.male,
                  color: Colors.blue,
                  size: 18,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text('$malePercentage%')
              ],
            ),
            const SizedBox(
              width: 16,
            ),
            Row(
              children: [
                const Icon(
                  Icons.female,
                  color: Colors.pink,
                  size: 18,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text('$femalePercentage%')
              ],
            ),
          ],
        ),
      ],
    );
  }
}
