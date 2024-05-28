import 'package:json_annotation/json_annotation.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/named_pokemon_api_resource.model.dart';

part 'pokemon_list.model.g.dart';

@JsonSerializable()
class PokemonList {
  final String? next;
  final String? previous;
  final List<NamedPokemonApiResource> results;

  PokemonList({this.next, this.previous, required this.results});

  factory PokemonList.fromJson(Map<String, dynamic> json) =>
      _$PokemonListFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonListToJson(this);
}
