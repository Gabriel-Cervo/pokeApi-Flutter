// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_specie.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonSpecie _$PokemonSpecieFromJson(Map<String, dynamic> json) =>
    PokemonSpecie(
      genderRate: (json['gender_rate'] as num).toInt(),
      color: NamedPokemonApiResource.fromJson(
          json['color'] as Map<String, dynamic>),
      flavorTextEntries: (json['flavor_text_entries'] as List<dynamic>)
          .map((e) => PokemonSpecieFlavor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonSpecieToJson(PokemonSpecie instance) =>
    <String, dynamic>{
      'gender_rate': instance.genderRate,
      'color': instance.color,
      'flavor_text_entries': instance.flavorTextEntries,
    };
