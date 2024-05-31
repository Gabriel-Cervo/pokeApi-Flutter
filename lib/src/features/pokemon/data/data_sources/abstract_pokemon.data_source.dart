import 'package:pokeapi/src/features/pokemon/domain/models/pokemon.model.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon_color.model.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon_list.model.dart';

abstract class AbstractPokemonDataSource {
  Future<PokemonList> getPokemonList(int page);
  Future<Pokemon> getPokemonDetails(String url);
  Future<PokemonColor> getPokemonColor(int id);
}
