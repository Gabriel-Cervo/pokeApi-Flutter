// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_specie_flavor.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonSpecieFlavor _$PokemonSpecieFlavorFromJson(Map<String, dynamic> json) =>
    PokemonSpecieFlavor(
      flavorText: json['flavor_text'] as String,
      language: NamedPokemonApiResource.fromJson(
          json['language'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonSpecieFlavorToJson(
        PokemonSpecieFlavor instance) =>
    <String, dynamic>{
      'flavor_text': instance.flavorText,
      'language': instance.language,
    };
