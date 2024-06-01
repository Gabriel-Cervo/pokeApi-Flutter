import 'package:pokeapi/src/features/pokemon/domain/models/pokemon.model.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon_list.model.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon_specie.model.dart';

abstract class AbstractPokemonDataSource {
  Future<PokemonList> getPokemonList(int page);
  Future<Pokemon> getPokemonDetails(String url);
  Future<PokemonSpecie> getPokemonSpecie(int id);
}
