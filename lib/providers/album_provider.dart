import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:starter_kit/models/album.dart';

part 'album_provider.g.dart';

@Riverpod(keepAlive: true)
FutureOr<Album> album(AlbumRef ref) async {
  final response = await http.get(Uri.https('api.deezer.com', '/album/302127'));
  final json = jsonDecode(response.body) as Map<String, dynamic>;
  return Album.fromJson(json);
}
