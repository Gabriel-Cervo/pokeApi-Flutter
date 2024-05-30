import 'package:dartz/dartz.dart';
import 'package:pokeapi/src/core/network/errors/network_failure.dart';
import 'package:pokeapi/src/core/utils/injector.dart';
import 'package:pokeapi/src/core/utils/usecases/usecase.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon.model.dart';
import 'package:pokeapi/src/features/pokemon/domain/repositories/abstract_pokemon.repository.dart';

class FetchPokemonDetailsUseCase extends UseCase<Pokemon, String> {
  final AbstractPokemonRepository repository =
      locator<AbstractPokemonRepository>();

  @override
  Future<Either<Failure, Pokemon>> execute(String params) {
    return repository.getPokemonDetails(params);
  }
}
