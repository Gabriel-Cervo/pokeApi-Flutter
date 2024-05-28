// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_type.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonType _$PokemonTypeFromJson(Map<String, dynamic> json) => PokemonType(
      slot: (json['slot'] as num).toInt(),
      type: NamedPokemonApiResource.fromJson(
          json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonTypeToJson(PokemonType instance) =>
    <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };
