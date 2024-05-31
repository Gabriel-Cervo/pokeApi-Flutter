import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pokeapi/src/core/network/network_service.dart';
import 'package:pokeapi/src/features/pokemon/data/data_sources/abstract_pokemon.data_source.dart';
import 'package:pokeapi/src/features/pokemon/data/data_sources/remote/pokemon.remote.data_source.dart';
import 'package:pokeapi/src/features/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'package:pokeapi/src/features/pokemon/domain/repositories/abstract_pokemon.repository.dart';
import 'package:pokeapi/src/features/pokemon/domain/usecases/fetch_pokemon_color.usecase.dart';
import 'package:pokeapi/src/features/pokemon/domain/usecases/fetch_pokemon_details.usecase.dart';
import 'package:pokeapi/src/features/pokemon/domain/usecases/fetch_pokemons.usecase.dart';

class Injector {
  void injectDependencies() {
    _injectDataSourceDependencies();
    _injectRepositoryDependencies();
    _injectUseCaseDependencies();
  }

  void _injectDataSourceDependencies() {
    locator.registerSingleton<Dio>(DioNetwork.appAPI);
    locator.registerSingleton<AbstractPokemonDataSource>(
        RemotePokemonDataSource());
  }

  void _injectRepositoryDependencies() {
    locator
        .registerSingleton<AbstractPokemonRepository>(PokemonRepositoryImpl());
  }

  void _injectUseCaseDependencies() {
    locator.registerSingleton<FetchPokemonDetailsUseCase>(
        FetchPokemonDetailsUseCase());
    locator.registerSingleton<FetchPokemonsUseCase>(FetchPokemonsUseCase());
    locator.registerSingleton<FetchPokemonColorUseCase>(
        FetchPokemonColorUseCase());
  }
}

GetIt locator = GetIt.instance;
Injector injector = Injector();
