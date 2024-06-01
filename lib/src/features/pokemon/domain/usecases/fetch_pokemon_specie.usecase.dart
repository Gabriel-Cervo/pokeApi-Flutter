import 'package:dartz/dartz.dart';
import 'package:pokeapi/src/core/network/errors/network_failure.dart';
import 'package:pokeapi/src/core/utils/injector.dart';
import 'package:pokeapi/src/core/utils/usecases/usecase.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon_specie.model.dart';
import 'package:pokeapi/src/features/pokemon/domain/repositories/abstract_pokemon.repository.dart';

class FetchPokemonSpecieUseCase extends UseCase<PokemonSpecie, int> {
  final AbstractPokemonRepository repository =
      locator<AbstractPokemonRepository>();

  @override
  Future<Either<Failure, PokemonSpecie>> execute(int params) {
    return repository.getPokemonSpecie(params);
  }
}
