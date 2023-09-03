import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starter_kit/models/album.dart';
import 'package:starter_kit/providers/album_provider.dart';
import 'package:starter_kit/providers/local_album_provider.dart';

class DeezerPage extends ConsumerWidget {
  const DeezerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Album>> albums = ref.watch(albumsProvider);
    return Scaffold(
        body: Center(
      child: switch (albums) {
        AsyncData(:final value) => ListView.builder(
            itemCount: value.length,
            itemBuilder: (BuildContext context, int index) {
              var album = value[index];
              return Text('${album.releaseDate!}');
            },
          ),
        AsyncError() => const Text('Oops, something unexpected happened'),
        _ => const CircularProgressIndicator(),
      },
    ));
  }
}
