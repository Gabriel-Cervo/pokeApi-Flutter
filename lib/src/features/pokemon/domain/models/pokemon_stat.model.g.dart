// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_stat.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonStat _$PokemonStatFromJson(Map<String, dynamic> json) => PokemonStat(
      baseStat: (json['base_stat'] as num).toInt(),
      stat: NamedPokemonApiResource.fromJson(
          json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonStatToJson(PokemonStat instance) =>
    <String, dynamic>{
      'base_stat': instance.baseStat,
      'stat': instance.stat,
    };
