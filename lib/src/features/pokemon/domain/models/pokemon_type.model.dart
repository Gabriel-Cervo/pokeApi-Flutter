import 'package:json_annotation/json_annotation.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/named_pokemon_api_resource.model.dart';

part 'pokemon_type.model.g.dart';

@JsonSerializable()
class PokemonType {
  final int slot;
  final NamedPokemonApiResource type;

  PokemonType({required this.slot, required this.type});

  factory PokemonType.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonTypeToJson(this);
}
