// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_list_riverpod.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PokemonList _$$_PokemonListFromJson(Map<String, dynamic> json) =>
    _$_PokemonList(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'],
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Pokemon.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PokemonListToJson(_$_PokemonList instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

_$_Pokemon _$$_PokemonFromJson(Map<String, dynamic> json) => _$_Pokemon(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$_PokemonToJson(_$_Pokemon instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
