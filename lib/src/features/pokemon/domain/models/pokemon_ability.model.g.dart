// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_ability.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonAbility _$PokemonAbilityFromJson(Map<String, dynamic> json) =>
    PokemonAbility(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      generation: NamedPokemonApiResource.fromJson(
          json['generation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonAbilityToJson(PokemonAbility instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'generation': instance.generation,
    };
