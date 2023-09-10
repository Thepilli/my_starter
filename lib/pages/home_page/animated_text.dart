// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starter_kit/app/app_colors.dart';
import 'package:starter_kit/pages/home_page/animated_text_provider.dart';
import 'package:starter_kit/shared/extensions/build_context.dart';

class AnimeText extends ConsumerWidget {
  const AnimeText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isExpanded = ref.watch(animeTextProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Text'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedCrossFade(
              firstChild: Text('Welcome to CodeByChance! In this comprehensive Flutter tutorial, well dive into creating '),
              secondChild: Text(
                  'Welcome to CodeByChance! In this comprehensive Flutter tutorial, well dive into creating an interactive Read More button with smooth text expansion animation. Learn how to implement this engaging feature in your Flutter apps user interface effortlessly.'),
              crossFadeState: isExpanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: Duration(seconds: 1),
            ),
            GestureDetector(
              onTap: () {
                ref.read(animeTextProvider.notifier).expandToggle(isExpanded);
              },
              child: Text('read more'),
            ),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)), color: AppColors.white),
              height: 60,
              width: 200,
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration:
                        BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))),
                    width: 100,
                    child: Text(
                      'Detail',
                      style: context.textTheme.titleSmall,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColors.black,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
                      child: Text(
                        'Detail',
                        style: context.textTheme.titleSmall?.copyWith(color: AppColors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
