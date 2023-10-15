import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starter_kit/pages/WIP_pages/filter_riverpod/filter_provider.dart';
import 'package:starter_kit/pages/WIP_pages/filter_riverpod/player_model.dart';
import 'package:starter_kit/shared/widgets/my_text_field.dart';

class FilterRiverpod extends ConsumerWidget {
  const FilterRiverpod({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Player> players = ref.watch(playerFilterProvider);
    return Scaffold(
      appBar: AppBar(
        title: MyTextField(
          label: 'seach players',
          onChanged: (p0) => ref.read(playerFilterProvider.notifier).filterPlayer(p0),
        ),
      ),
      body: ListView.separated(
        itemCount: players.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
        itemBuilder: (BuildContext context, int index) {
          Player player = players[index];
          return ListTile(
            title: Text(player.name),
            subtitle: Text(player.country),
          );
        },
      ),
    );
  }
}
