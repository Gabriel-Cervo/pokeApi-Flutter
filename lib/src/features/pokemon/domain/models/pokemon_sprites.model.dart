import 'package:json_annotation/json_annotation.dart';

part 'pokemon_sprites.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokemonSprites {
  final String frontDefault;
  final String backDefault;

  PokemonSprites({required this.frontDefault, required this.backDefault});

  factory PokemonSprites.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpritesFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonSpritesToJson(this);
}
