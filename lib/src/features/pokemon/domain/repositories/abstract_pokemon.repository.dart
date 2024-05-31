import 'package:pokeapi/src/core/network/errors/network_failure.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon.model.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon_list.model.dart';
import 'package:dartz/dartz.dart';

abstract class AbstractPokemonRepository {
  Future<Either<Failure, PokemonList>> getPokemonList(int page);
  Future<Either<Failure, Pokemon>> getPokemonDetails(String url);
}

class EmptyParams {}
