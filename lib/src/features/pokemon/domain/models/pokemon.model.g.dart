// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      baseExperience: (json['base_experience'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      weight: (json['weight'] as num).toInt(),
      isDefault: json['is_default'] as bool,
      forms: (json['forms'] as List<dynamic>)
          .map((e) =>
              NamedPokemonApiResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      order: (json['order'] as num).toInt(),
      abilities: (json['abilities'] as List<dynamic>)
          .map((e) => PokemonAbility.fromJson(e as Map<String, dynamic>))
          .toList(),
      moves: (json['moves'] as List<dynamic>)
          .map((e) => PokemonMove.fromJson(e as Map<String, dynamic>))
          .toList(),
      types: (json['types'] as List<dynamic>)
          .map((e) => PokemonType.fromJson(e as Map<String, dynamic>))
          .toList(),
      sprites: PokemonSprites.fromJson(json['sprites'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'base_experience': instance.baseExperience,
      'height': instance.height,
      'weight': instance.weight,
      'order': instance.order,
      'is_default': instance.isDefault,
      'forms': instance.forms,
      'abilities': instance.abilities,
      'moves': instance.moves,
      'types': instance.types,
      'sprites': instance.sprites,
    };
