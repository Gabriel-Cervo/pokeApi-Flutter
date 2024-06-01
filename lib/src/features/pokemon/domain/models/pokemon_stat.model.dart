import 'package:json_annotation/json_annotation.dart';
import 'package:pokeapi/src/features/pokemon/domain/models/named_pokemon_api_resource.model.dart';

part 'pokemon_stat.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokemonStat {
  final int baseStat;
  final NamedPokemonApiResource stat;

  PokemonStat({required this.baseStat, required this.stat});

  factory PokemonStat.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonStatToJson(this);
}
