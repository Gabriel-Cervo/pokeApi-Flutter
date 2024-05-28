// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'named_pokemon_api_resource.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NamedPokemonApiResource _$NamedPokemonApiResourceFromJson(
        Map<String, dynamic> json) =>
    NamedPokemonApiResource(
      url: json['url'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$NamedPokemonApiResourceToJson(
        NamedPokemonApiResource instance) =>
    <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
    };
