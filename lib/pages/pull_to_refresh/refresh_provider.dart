import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'refresh_provider.g.dart';

@riverpod
class Refresh extends _$Refresh {
  @override
  FutureOr<List<String>> build() {
    return ['Item1', 'Item2', 'Item3'];
  }

  FutureOr<List<String>> get() {
    return ['Item1', 'Item2', 'Item4'];
  }

  Future<List<String>> getList() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.get(url);
    final List newItems = json.decode(response.body);
    final items = newItems.map<String>(
      (item) {
        final number = item['id'];
        return number;
      },
    ).toList();
    return ['Item1', 'Item2', 'Item4'];
  }
}
