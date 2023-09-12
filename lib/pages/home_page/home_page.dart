// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starter_kit/shared/extensions/build_context.dart';

import '../../app/app_colors.dart';
import '../../shared/util/theme_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
              color: AppColors.blue,
              onPressed: () {},
              child: Text('Material button'),
            ),
            ElevatedButton(
                onPressed: () {
                  openAnimatedDialog(context);
                },
                child: Text('Elevated button')),
            OutlinedButton(onPressed: () {}, child: Text('Outlined button')),
            IconButton(onPressed: () {}, icon: Icon(Icons.abc)),
            TextButton.icon(onPressed: () {}, icon: Icon(Icons.abc), label: Text('Text button')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Checkbox'),
                Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Switch'),
                Switch(
                  value: false,
                  onChanged: (value) {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Radio'),
                Radio(
                  value: false,
                  groupValue: true,
                  onChanged: (value) {},
                ),
              ],
            ),
            TextField(
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              decoration: InputDecoration(
                label: Text(
                  'data',
                  style: context.textTheme.titleLarge?.copyWith(color: AppColors.txtDark),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void openAnimatedDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) {
        return Container();
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: Tween<double>(begin: 0, end: 1).animate(animation),
          child: AlertDialog(
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.abc))
            ],
            title: Text('data'),
            content: Text('data'),
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          ),
        );
      },
    );
  }
}
