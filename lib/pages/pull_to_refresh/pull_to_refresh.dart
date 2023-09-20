import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PullToRefresh extends ConsumerWidget {
  const PullToRefresh({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Workaround: watch the .future provider directly
    // ref.watch(dataProvider.future);

    final value = ref.watch(dataProvider).value;

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(dataProvider.future), // throws
        child: ListView.builder(
          itemCount: value?.length ?? 0,
          itemBuilder: (context, index) {
            return Text(value![index]);
          },
        ),
      ),
    );
  }
}

final dataProvider = FutureProvider.autoDispose((ref) async {
  await Future.delayed(const Duration(seconds: 3));

  final random = Random();
  return List.generate(20, (index) => random.nextInt(100).toString());
});
