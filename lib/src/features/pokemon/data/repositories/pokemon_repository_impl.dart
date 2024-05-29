import 'package:dartz/dartz.dart';
import 'package:pokeapi/src/core/network/errors/network_exception.dart';
import 'package:pokeapi/src/core/network/errors/network_failure.dart';
import 'package:pokeapi/src/features/pokemon/data/data_sources/abstract_pokemon.data_source.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon.model.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon_list.model.dart';
import 'package:pokeapi/src/features/pokemon/domain/repositories/abstract_pokemon.repository.dart';

class PokemonRepositoryImpl extends AbstractPokemonRepository {
  final AbstractPokemonDataSource dataSource;

  PokemonRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, PokemonList>> getPokemonList() async {
    try {
      final result = await dataSource.getPokemonList();
      return Right(result);
    } on NetworkException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, Pokemon>> getPokemonDetails(int id) async {
    try {
      final result = await dataSource.getPokemonDetails(id);
      return Right(result);
    } on NetworkException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}