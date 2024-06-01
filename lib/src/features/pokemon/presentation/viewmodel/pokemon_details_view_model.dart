import 'package:mobx/mobx.dart';
import 'package:pokeapi/src/core/network/errors/network_failure.dart';
import 'package:pokeapi/src/core/utils/constants/network_constants.dart';
import 'package:pokeapi/src/core/utils/injector.dart';
import 'package:pokeapi/src/core/utils/state/request.state.dart';
import 'package:pokeapi/src/core/utils/usecases/usecase.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon.model.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon_color.model.dart';
import 'package:pokeapi/src/features/pokemon/domain/usecases/fetch_pokemon_color.usecase.dart';
import 'package:pokeapi/src/features/pokemon/domain/usecases/fetch_pokemon_details.usecase.dart';
part 'pokemon_details_view_model.g.dart';

abstract class PokemonDetailsViewModelBase with Store {
  final UseCase fetchPokemonColorUseCase = locator<FetchPokemonColorUseCase>();
  final UseCase fetchPokemonDetailsUseCase =
      locator<FetchPokemonDetailsUseCase>();

  @observable
  Pokemon? pokemonDetails;

  @observable
  PokemonColor? pokemonColor;

  @observable
  Failure? error;

  @observable
  RequestState fetchState = RequestState.initial;

  @action
  Future<void> fetchPokemonColor(int id) async {
    fetchState = RequestState.loading;

    final response = await fetchPokemonColorUseCase.execute(id);
    response.fold((l) {
      error = l;
      fetchState = RequestState.error;
    }, (r) async {
      final data = r as PokemonColor;
      pokemonColor = data;
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
      return fetchPokemonColor(data.id);
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
