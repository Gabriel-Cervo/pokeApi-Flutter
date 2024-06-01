import 'package:mobx/mobx.dart';
import 'package:pokeapi/src/core/network/errors/network_failure.dart';
import 'package:pokeapi/src/core/utils/constants/network_constants.dart';
import 'package:pokeapi/src/core/utils/injector.dart';
import 'package:pokeapi/src/core/utils/state/request.state.dart';
import 'package:pokeapi/src/core/utils/usecases/usecase.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon.model.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon_specie.model.dart';
import 'package:pokeapi/src/features/pokemon/domain/usecases/fetch_pokemon_details.usecase.dart';
import 'package:pokeapi/src/features/pokemon/domain/usecases/fetch_pokemon_specie.usecase.dart';
part 'pokemon_details_view_model.g.dart';

abstract class PokemonDetailsViewModelBase with Store {
  final UseCase fetchPokemonSpecieUseCase =
      locator<FetchPokemonSpecieUseCase>();
  final UseCase fetchPokemonDetailsUseCase =
      locator<FetchPokemonDetailsUseCase>();

  @observable
  Pokemon? pokemonDetails;

  @observable
  PokemonSpecie? pokemonSpecie;

  @observable
  Failure? error;

  @observable
  RequestState fetchState = RequestState.initial;

  @action
  Future<void> fetchPokemonSpecie(int id) async {
    fetchState = RequestState.loading;

    final response = await fetchPokemonSpecieUseCase.execute(id);
    response.fold((l) {
      error = l;
      fetchState = RequestState.error;
    }, (r) async {
      final data = r as PokemonSpecie;
      pokemonSpecie = data;
      fetchState = RequestState.success;
    });
  }

  @action
  Future<void> fetchPokemonDetails(int id) async {
    fetchState = RequestState.loading;

    final response = await fetchPokemonDetailsUseCase
        .execute('${NetworkConstants.baseApiUrl}/pokemon/$id');
    return response.fold((l) {
      error = l;
      fetchState = RequestState.error;
    }, (r) async {
      final data = r as Pokemon;
      pokemonDetails = data;
      fetchState = RequestState.success;
      return fetchPokemonSpecie(data.id);
    });
  }

  @action
  Future<void> fetchNextPokemon() async {
    return fetchPokemonDetails((pokemonDetails?.id ?? 1) + 1);
  }

  @action
  Future<void> fetchPrevPokemon() async {
    return fetchPokemonDetails((pokemonDetails?.id ?? 1) - 1);
  }
}

class PokemonDetailsViewModel = PokemonDetailsViewModelBase
    with _$PokemonDetailsViewModel;
