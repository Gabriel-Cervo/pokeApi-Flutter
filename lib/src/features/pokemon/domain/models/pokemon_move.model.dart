import 'package:json_annotation/json_annotation.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/named_pokemon_api_resource.model.dart';

part 'pokemon_move.model.g.dart';

@JsonSerializable()
class PokemonMove {
  final NamedPokemonApiResource move;

  PokemonMove({required this.move});

  factory PokemonMove.fromJson(Map<String, dynamic> json) =>
      _$PokemonMoveFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonMoveToJson(this);
}
