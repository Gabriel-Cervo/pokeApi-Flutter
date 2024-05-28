import 'package:dartz/dartz.dart';
import 'package:pokeapi/src/core/network/errors/network_failure.dart';
import 'package:pokeapi/src/core/utils/usecases/usecase.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon.model.dart';
import 'package:pokeapi/src/features/pokemon/domain/repositories/abstract_pokemon.repository.dart';

class FetchPokemonDetails extends UseCase<Pokemon, int> {
  final AbstractPokemonRepository repository;

  FetchPokemonDetails(this.repository);

  @override
  Future<Either<Failure, Pokemon>> execute(int params) async {
    final response = await repository.getPokemonDetails(params);
    return response.fold((l) => Left(l), (r) => Right(r));
  }
}
