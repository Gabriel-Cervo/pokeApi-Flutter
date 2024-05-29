import 'package:mobx/mobx.dart';
import 'package:pokeapi/src/core/network/errors/network_failure.dart';
import 'package:pokeapi/src/core/utils/state/request.state.dart';
import 'package:pokeapi/src/core/utils/usecases/usecase.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon_list.model.dart';

part 'pokemon_list_view_model.g.dart';

abstract class PokemonListViewModelBase with Store {
  final UseCase fetchPokemonsUseCase;

  PokemonListViewModelBase(this.fetchPokemonsUseCase);

  @observable
  PokemonList? pokemonList;

  @observable
  Failure? error;

  @observable
  RequestState fetchState = RequestState.initial;

  @action
  Future<void> fetchPokemons() async {
    fetchState = RequestState.loading;

    final response = await fetchPokemonsUseCase.execute({});
    response.fold((l) {
      error = l;
      fetchState = RequestState.error;
    }, (r) {
      pokemonList = r as PokemonList;
      fetchState = RequestState.success;
    });
  }
}

class PokemonListViewModel = PokemonListViewModelBase
    with _$PokemonListViewModel;
