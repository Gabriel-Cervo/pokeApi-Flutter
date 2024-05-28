// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_move.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonMove _$PokemonMoveFromJson(Map<String, dynamic> json) => PokemonMove(
      move: NamedPokemonApiResource.fromJson(
          json['move'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonMoveToJson(PokemonMove instance) =>
    <String, dynamic>{
      'move': instance.move,
    };
