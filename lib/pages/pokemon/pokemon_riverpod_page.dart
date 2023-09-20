import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starter_kit/models/pokemon_all.dart';
import 'package:starter_kit/providers/pokemon_all_provider.dart';

class PokemonRiverpodPage extends ConsumerWidget {
  const PokemonRiverpodPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<PokemonAll>> pokemons = ref.watch(pokemonAllProvider);
    return Scaffold(
      body: Center(
          child: switch (pokemons) {
        AsyncData(:final value) => ListView.builder(
            itemCount: value.length,
            itemBuilder: (BuildContext context, int index) {
              PokemonAll pokemon = value[index];
              return ListTile(
                title: Text(pokemon.name),
                subtitle: Row(
                  children: List.generate(
                    pokemon.typeofpokemon.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        decoration:
                            const BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.all(Radius.circular(20))),
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          pokemon.typeofpokemon[index],
                        ),
                      ),
                    ),
                  ),
                ),
                leading: CachedNetworkImage(
                  imageUrl: pokemon.imageurl,
                  width: 100,
                  height: 100,
                ),
              );
            },
          ),
        AsyncError() => const Text('error'),
        _ => const CircularProgressIndicator(),
      }),
    );
  }
}
//   Widget build(BuildContext context, WidgetRef ref) {
//     final AsyncValue<PokemonList> pokemons = ref.watch(pokemonListProvider);
//     return Scaffold(
//       body: Center(
//           child: switch (pokemons) {
//         AsyncData(:final value) => ListView.builder(
//             itemCount: value.results!.length,
//             itemBuilder: (BuildContext context, int index) {
//               Pokemon pokemon = value.results![index];
//               return Text(pokemon.name!);
//             },
//           ),
//         AsyncError() => const Text('error'),
//         _ => const CircularProgressIndicator(),
//       }),
//     );
//   }
// }
//   Widget build(BuildContext context, WidgetRef ref) {
//     final AsyncValue<PokemonDetail> pokemon = ref.watch(pokemonDetailProvider);
//     return Scaffold(
//       body: Center(
//           child: switch (pokemon) {
//         AsyncData(:final value) => Image.network(value.sprites!.versions!.generationV!.blackWhite!.animated!.frontDefault!),
//         AsyncError() => const Text('error'),
//         _ => const CircularProgressIndicator(),
//       }),
//     );
//   }
// }
