// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_ability.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonAbility _$PokemonAbilityFromJson(Map<String, dynamic> json) =>
    PokemonAbility(
      ability: NamedPokemonApiResource.fromJson(
          json['ability'] as Map<String, dynamic>),
      slot: (json['slot'] as num).toInt(),
    );

Map<String, dynamic> _$PokemonAbilityToJson(PokemonAbility instance) =>
    <String, dynamic>{
      'ability': instance.ability,
      'slot': instance.slot,
    };
