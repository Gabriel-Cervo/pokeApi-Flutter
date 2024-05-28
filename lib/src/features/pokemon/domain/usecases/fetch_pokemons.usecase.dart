import 'package:dartz/dartz.dart';
import 'package:pokeapi/src/core/network/errors/network_failure.dart';
import 'package:pokeapi/src/core/utils/usecases/usecase.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon_list.model.dart';
import 'package:pokeapi/src/features/pokemon/domain/repositories/abstract_pokemon.repository.dart';

class FetchPokemonsUseCase extends UseCase<PokemonList, EmptyParams> {
  final AbstractPokemonRepository repository;

  FetchPokemonsUseCase(this.repository);

  @override
  Future<Either<Failure, PokemonList>> execute(EmptyParams params) {
    return repository.getPokemonList();
  }
}
