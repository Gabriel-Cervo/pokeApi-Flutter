import 'package:json_annotation/json_annotation.dart';

part 'named_pokemon_api_resource.model.g.dart';

@JsonSerializable()
class NamedPokemonApiResource {
  final String url;
  final String name;

  NamedPokemonApiResource({required this.url, required this.name});

  factory NamedPokemonApiResource.fromJson(Map<String, dynamic> json) =>
      _$NamedPokemonApiResourceFromJson(json);
  Map<String, dynamic> toJson() => _$NamedPokemonApiResourceToJson(this);
}
