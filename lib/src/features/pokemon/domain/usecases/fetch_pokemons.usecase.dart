import 'package:dartz/dartz.dart';
import 'package:pokeapi/src/core/network/errors/network_failure.dart';
import 'package:pokeapi/src/core/utils/injector.dart';
import 'package:pokeapi/src/core/utils/usecases/usecase.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon_list.model.dart';
import 'package:pokeapi/src/features/pokemon/domain/repositories/abstract_pokemon.repository.dart';

class FetchPokemonsUseCase extends UseCase<PokemonList, int> {
  final AbstractPokemonRepository repository =
      locator<AbstractPokemonRepository>();

  @override
  Future<Either<Failure, PokemonList>> execute(int params) {
    return repository.getPokemonList(params);
  }
}
