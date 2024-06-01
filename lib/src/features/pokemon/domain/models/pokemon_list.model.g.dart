// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_list.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonList _$PokemonListFromJson(Map<String, dynamic> json) => PokemonList(
      next: json['next'] as String?,
      count: (json['count'] as num?)?.toInt(),
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) =>
              NamedPokemonApiResource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonListToJson(PokemonList instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
