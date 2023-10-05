import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:starter_kit/models/pokemon_list_riverpod.dart';

// Necessary for code-generation to work
part 'pokemon_list_riverpod_provider.g.dart';

/// This will create a provider named `activityProvider`
/// which will cache the result of this function.
@riverpod
Future<PokemonList> pokemonList(PokemonListRef ref) async {
  // Using package:http, we fetch a random activity from the Bored API.
  final response = await http.get(Uri.https('pokeapi.co', '/api/v2/pokemon', {'limit': '151', 'offset': '0'}));
  // Using dart:convert, we then decode the JSON payload into a Map data structure.
  final json = jsonDecode(response.body) as Map<String, dynamic>;
  // Finally, we convert the Map into an Activity instance.
  return PokemonList.fromJson(json);
}