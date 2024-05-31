import 'package:json_annotation/json_annotation.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/named_pokemon_api_resource.model.dart';
part 'pokemon_color.model.g.dart';

@JsonSerializable()
class PokemonColor {
  NamedPokemonApiResource color;

  PokemonColor({required this.color});

  factory PokemonColor.fromJson(Map<String, dynamic> json) =>
      _$PokemonColorFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonColorToJson(this);
}
