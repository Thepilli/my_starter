// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starter_kit/shared/extensions/build_context.dart';

import '../../shared/util/theme_provider.dart';

class FontPage extends ConsumerWidget {
  const FontPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isDarkMode = ref.watch(darkThemeSwitchProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Starter Kit'),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(darkThemeSwitchProvider.notifier).switchTheme();
              },
              icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'titleLarge titleLarge ',
            style: context.textTheme.titleLarge?.copyWith(),
          ),
          Text(
            'titleMedium titleMedium ',
            style: context.textTheme.titleMedium?.copyWith(),
          ),
          Text(
            'titleSmall titleSmall ',
            style: context.textTheme.titleSmall?.copyWith(),
          ),
          Text(
            'bodyLarge bodyLarge ',
            style: context.textTheme.bodyLarge?.copyWith(),
          ),
          Text(
            'bodyMedium bodyMedium ',
            style: context.textTheme.bodyMedium?.copyWith(),
          ),
          Text(
            'bodySmall bodySmall ',
            style: context.textTheme.bodySmall?.copyWith(),
          ),
        ],
      ),
    );
  }
}
