// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_color.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonColor _$PokemonColorFromJson(Map<String, dynamic> json) => PokemonColor(
      color: NamedPokemonApiResource.fromJson(
          json['color'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonColorToJson(PokemonColor instance) =>
    <String, dynamic>{
      'color': instance.color,
    };
