import 'package:pokeapi/src/core/network/errors/network_failure.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon.model.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon_list.model.dart';
import 'package:dartz/dartz.dart';

abstract class AbstractPokemonRepository {
  Future<Either<Failure, PokemonList>> getPokemonList();
  Future<Either<Failure, Pokemon>> getPokemonDetails(int id);
}

class EmptyParams {}
