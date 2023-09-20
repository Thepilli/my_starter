// To parse this JSON data, do
//
//     final pokemonList = pokemonListFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_list_riverpod.freezed.dart';
part 'pokemon_list_riverpod.g.dart';

PokemonList pokemonListFromJson(String str) => PokemonList.fromJson(json.decode(str));

String pokemonListToJson(PokemonList data) => json.encode(data.toJson());

@freezed
class PokemonList with _$PokemonList {
  const factory PokemonList({
    @JsonKey(name: "count") int? count,
    @JsonKey(name: "next") String? next,
    @JsonKey(name: "previous") dynamic previous,
    @JsonKey(name: "results") List<Pokemon>? results,
  }) = _PokemonList;

  factory PokemonList.fromJson(Map<String, dynamic> json) => _$PokemonListFromJson(json);
}

@freezed
class Pokemon with _$Pokemon {
  const factory Pokemon({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "url") String? url,
  }) = _Pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonFromJson(json);
}
