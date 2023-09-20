import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:starter_kit/models/pokemon_all.dart';

// Necessary for code-generation to work
part 'pokemon_all_provider.g.dart';

/// This will create a provider named `activityProvider`
/// which will cache the result of this function.
@riverpod
Future<List<PokemonAll>> pokemonAll(PokemonAllRef ref) async {
  // Using package:http, we fetch a random activity from the Bored API.
  final response = await rootBundle.loadString('assets/pokemon_all.json');
  // Using dart:convert, we then decode the JSON payload into a Map data structure.
  final jsonResponse = json.decode(response);
  final pokemons = (jsonResponse as List).map((item) => PokemonAll.fromJson(item)).toList();
  print('PokemonAll Provider');
  return pokemons;
}
