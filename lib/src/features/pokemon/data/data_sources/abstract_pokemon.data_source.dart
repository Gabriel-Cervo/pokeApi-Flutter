import 'package:pokeapi/src/features/pokemon/domain/models/pokemon.model.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon_list.model.dart';

abstract class AbstractPokemonDataSource {
  Future<PokemonList> getPokemonList();
  Future<Pokemon> getPokemonDetails(int id);
}
