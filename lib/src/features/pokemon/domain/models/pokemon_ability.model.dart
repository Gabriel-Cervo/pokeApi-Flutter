import 'package:json_annotation/json_annotation.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/named_pokemon_api_resource.model.dart';

part 'pokemon_ability.model.g.dart';

@JsonSerializable()
class PokemonAbility {
  final int id;
  final String name;
  final NamedPokemonApiResource generation;

  PokemonAbility(
      {required this.id, required this.name, required this.generation});

  factory PokemonAbility.fromJson(Map<String, dynamic> json) =>
      _$PokemonAbilityFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonAbilityToJson(this);
}
