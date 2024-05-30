import 'package:dio/dio.dart';
import 'package:pokeapi/src/core/network/errors/network_exception.dart';
import 'package:pokeapi/src/core/utils/constants/network_constants.dart';
import 'package:pokeapi/src/core/utils/injector.dart';
import 'package:pokeapi/src/core/utils/logs/logger.dart';
import 'package:pokeapi/src/features/pokemon/data/data_sources/abstract_pokemon.data_source.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon.model.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon_list.model.dart';

class RemotePokemonDataSource extends AbstractPokemonDataSource {
  final Dio dio = locator<Dio>();

  @override
  Future<PokemonList> getPokemonList() async {
    try {
      final response = await dio.get('$baseApiUrl/pokemon?limit=10');

      if (response.data == null) {
        throw NetworkException("Error", response.statusCode);
      }

      final PokemonList data = PokemonList.fromJson(response.data!);
      return data;
    } on DioException catch (e) {
      throw NetworkException(e.toString(), e.response?.statusCode);
    } on NetworkException {
      rethrow;
    } catch (e) {
      throw NetworkException(e.toString(), null);
    }
  }

  @override
  Future<Pokemon> getPokemonDetails(String url) async {
    try {
      final response = await dio.get(url);

      if (response.data == null) {
        throw NetworkException("Error", response.statusCode);
      }

      final Pokemon data = Pokemon.fromJson(response.data!);
      return data;
    } on DioException catch (e) {
      throw NetworkException(e.toString(), e.response?.statusCode);
    } on NetworkException {
      rethrow;
    } catch (e) {
      throw NetworkException(e.toString(), null);
    }
  }
}
