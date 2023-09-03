import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:starter_kit/models/album.dart';
part 'local_album_provider.g.dart';

@Riverpod(keepAlive: true)
FutureOr<List<Album>> albums(AlbumsRef ref) async {
  final String response = await rootBundle.loadString("assets/album_response.json");
  final List<Album> albums = albumFromJson(response);

  return albums;
}
