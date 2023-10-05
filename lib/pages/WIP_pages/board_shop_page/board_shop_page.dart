import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starter_kit/app/app_colors.dart';
import 'package:starter_kit/pages/WIP_pages/board_shop_page/boards_list.dart';
import 'package:starter_kit/pages/WIP_pages/board_shop_page/spin_provider.dart';

class BoardShopPage extends ConsumerWidget {
  const BoardShopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    double myAngle = ref.watch(spinProvider);
    int pickedBoardIndex = ref.watch(pickedBoardProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(spinProvider.notifier).halfspin();
        },
        child: const Icon(Icons.rotate_right),
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -size.height / 5,
            child: SizedBox(
              child: AnimatedRotation(
                turns: myAngle,
                duration: const Duration(milliseconds: 500),
                curve: Curves.linear,
                child: CircleAvatar(
                  backgroundColor: AppColors.primaryDark,
                  radius: size.width / 2,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        bottom: -size.width / 2,
                        left: size.width / 8,
                        child: Container(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/boards/${boards[pickedBoardIndex]}',
                                height: 300,
                              ),
                              Text((pickedBoardIndex + 1).toString())
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              left: 100,
              bottom: 300,
              child: Container(
                height: 100,
                width: 100,
                color: AppColors.black,
              )),
          Positioned(top: size.height - 200, child: boardPicker(ref))
        ],
      ),
    );
  }

  Widget boardPicker(WidgetRef ref) => SizedBox(
        height: 100,
        width: 400,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: boards.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  clipBehavior: Clip.none,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.black, width: 3), borderRadius: BorderRadius.circular(100)),
                  height: 90,
                  width: 90,
                ),
              ),
              GestureDetector(
                onTap: () {
                  ref.read(spinProvider.notifier).fullspin();
                  ref.read(pickedBoardProvider.notifier).pickBoard(index);
                },
                child: Transform.rotate(
                  angle: pi / 15,
                  child: Image.asset(
                    'assets/boards/${boards[index]}',
                    fit: BoxFit.contain,
                  ),
                ),
              )
            ]);
          },
        ),
      );
}
