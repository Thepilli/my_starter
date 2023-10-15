import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:starter_kit/pages/WIP_pages/filter_riverpod/player_model.dart';

part 'filter_provider.g.dart';

@riverpod
class PlayerFilter extends _$PlayerFilter {
  @override
  List<Player> build() {
    return allPlayers;
  }

  void filterPlayer(String filterString) {
    List<Player> results = [];
    if (filterString.isEmpty) {
      results = allPlayers;
    } else {
      results = allPlayers.where((element) => element.name.toLowerCase().contains(filterString)).toList();
    }
    state = results;
  }
}
