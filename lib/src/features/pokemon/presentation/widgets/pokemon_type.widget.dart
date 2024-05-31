import 'package:flutter/material.dart';
import 'package:pokeapi/src/core/utils/constants/colors_constants.dart';

class PokemonTypeWidget extends StatelessWidget {
  final String type;
  const PokemonTypeWidget({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: _getColorForType()),
      height: 22,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2),
        child: Text(
          type.toUpperCase(),
          style: _getTextStyleForType(),
        ),
      ),
    );
  }

  Color _getColorForType() {
    switch (type.toUpperCase()) {
      case 'BUG':
      case 'GRASS':
        return Colors.green;
      case 'DRAGON':
      case 'FIGHTING':
        return Colors.orange;
      case 'FAIRY':
      case 'PSYCHIC':
        return Colors.pink;
      case 'FIRE':
        return Colors.red;
      case 'GHOST':
      case 'POISON':
        return Colors.purple;
      case 'GROUND':
      case 'ELECTRIC':
        return Colors.yellow;
      case 'FLYING':
      case 'ICE':
      case 'WATER':
        return Colors.blue;
      case 'ROCK':
        return Colors.brown;
      default:
        return ColorsConstants.backgroundGray;
    }
  }

  TextStyle _getTextStyleForType() {
    Color textColor;

    switch (type.toUpperCase()) {
      case 'BUG':
      case 'GRASS':
      case 'DRAGON':
      case 'FIGHTING':
      case 'FAIRY':
      case 'PSYCHIC':
      case 'FIRE':
      case 'GHOST':
      case 'ROCK':
      case 'FLYING':
      case 'ICE':
      case 'WATER':
      case 'POISON':
        textColor = Colors.white;
      default:
        textColor = Colors.black;
    }
    return TextStyle(
        fontSize: 10, color: textColor, fontWeight: FontWeight.bold);
  }
}
