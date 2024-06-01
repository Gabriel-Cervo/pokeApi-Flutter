import 'package:json_annotation/json_annotation.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/named_pokemon_api_resource.model.dart';

part 'pokemon_specie_flavor.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokemonSpecieFlavor {
  final String flavorText;
  final NamedPokemonApiResource language;

  PokemonSpecieFlavor({required this.flavorText, required this.language});

  factory PokemonSpecieFlavor.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpecieFlavorFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonSpecieFlavorToJson(this);
}
