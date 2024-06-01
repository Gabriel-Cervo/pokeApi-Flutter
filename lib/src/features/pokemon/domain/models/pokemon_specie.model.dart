import 'package:json_annotation/json_annotation.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/named_pokemon_api_resource.model.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon_specie_flavor.model.dart';

part 'pokemon_specie.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokemonSpecie {
  final int genderRate;
  final NamedPokemonApiResource color;
  final List<PokemonSpecieFlavor> flavorTextEntries;

  PokemonSpecie(
      {required this.genderRate,
      required this.color,
      required this.flavorTextEntries});

  factory PokemonSpecie.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpecieFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonSpecieToJson(this);
}
