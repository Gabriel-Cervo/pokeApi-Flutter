import 'package:dio/dio.dart';
import 'package:pokeapi/src/core/network/errors/network_exception.dart';
import 'package:pokeapi/src/core/utils/constants/network_constants.dart';
import 'package:pokeapi/src/features/pokemon/data/data_sources/abstract_pokemon.data_source.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon.model.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon_list.model.dart';

class RemotePokemonDataSource extends AbstractPokemonDataSource {
  final Dio dio;

  RemotePokemonDataSource(this.dio);

  @override
  Future<PokemonList> getPokemonList() async {
    try {
      final response =
          await dio.get<PokemonList>('$baseApiUrl/pokemon/limit=10');

      if (response.data == null) {
        throw NetworkException("Error", response.statusCode);
      }

      return response.data!;
    } on DioException catch (e) {
      throw NetworkException(e.toString(), e.response?.statusCode);
    } on NetworkException {
      rethrow;
    } catch (e) {
      throw NetworkException(e.toString(), null);
    }
  }

  @override
  Future<Pokemon> getPokemonDetails(int id) async {
    try {
      final response = await dio.get<Pokemon>('$baseApiUrl/pokemon/$id');

      if (response.data == null) {
        throw NetworkException("Error", response.statusCode);
      }

      return response.data!;
    } on DioException catch (e) {
      throw NetworkException(e.toString(), e.response?.statusCode);
    } on NetworkException {
      rethrow;
    } catch (e) {
      throw NetworkException(e.toString(), null);
    }
  }
}
