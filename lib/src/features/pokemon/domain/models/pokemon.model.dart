import 'package:json_annotation/json_annotation.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/named_pokemon_api_resource.model.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon_ability.model.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon_move.model.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon_sprites.model.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/pokemon_type.model.dart';

part 'pokemon.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Pokemon {
  final int id;
  final String name;
  final int baseExperience;
  final int height;
  final int weight;
  final int order;
  final bool isDefault;
  final List<NamedPokemonApiResource> forms;
  final List<PokemonAbility> abilities;
  final List<PokemonMove> moves;
  final List<PokemonType> types;
  final PokemonSprites sprites;

  Pokemon(
      {required this.id,
      required this.name,
      required this.baseExperience,
      required this.height,
      required this.weight,
      required this.isDefault,
      required this.forms,
      required this.order,
      required this.abilities,
      required this.moves,
      required this.types,
      required this.sprites});

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}
