import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:pokeapi/src/core/network/errors/network_failure.dart';
import 'package:pokeapi/src/core/utils/injector.dart';
import 'package:pokeapi/src/core/utils/logs/logger.dart';
import 'package:pokeapi/src/core/utils/state/request.state.dart';
import 'package:pokeapi/src/core/utils/usecases/usecase.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon.model.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon_list.model.dart';
import 'package:pokeapi/src/features/pokemon/domain/repositories/abstract_pokemon.repository.dart';
import 'package:pokeapi/src/features/pokemon/domain/usecases/fetch_pokemon_details.usecase.dart';
import 'package:pokeapi/src/features/pokemon/domain/usecases/fetch_pokemons.usecase.dart';

part 'pokemon_list_view_model.g.dart';

abstract class PokemonListViewModelBase with Store {
  final UseCase fetchPokemonsUseCase = locator<FetchPokemonsUseCase>();
  final UseCase fetchPokemonDetailsUseCase =
      locator<FetchPokemonDetailsUseCase>();

  @observable
  List<Pokemon>? pokemons;

  @observable
  Failure? error;

  @observable
  RequestState fetchState = RequestState.initial;

  @action
  Future<void> fetchPokemons() async {
    fetchState = RequestState.loading;

    final response = await fetchPokemonsUseCase.execute(EmptyParams());
    response.fold((l) {
      error = l;
      fetchState = RequestState.error;
    }, (r) async {
      final data = r as PokemonList;

      try {
        pokemons = await _fetchPokemonsDetails(data);
        fetchState = RequestState.success;
      } on Failure catch (e) {
        error = e;
        fetchState = RequestState.error;
      }
    });
  }

  Future<List<Pokemon>> _fetchPokemonsDetails(PokemonList data) async {
    List<Pokemon> pokemonsDetails = [];

    final response = await Future.wait<Either<Failure, dynamic>>(
        data.results.map((e) => fetchPokemonDetailsUseCase.execute(e.url)));

    for (var element in response) {
      element.fold((l) => throw l, (r) => pokemonsDetails.add(r as Pokemon));
    }

    logger.info(pokemonsDetails);
    return pokemonsDetails;
  }
}

class PokemonListViewModel = PokemonListViewModelBase
    with _$PokemonListViewModel;
