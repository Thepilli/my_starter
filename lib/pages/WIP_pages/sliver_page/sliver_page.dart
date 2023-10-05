// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starter_kit/app/app_colors.dart';
import 'package:starter_kit/app/app_constants.dart';

class SliverPage extends ConsumerWidget {
  const SliverPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageView(
      children: const [
        SliverPageList(),
        SliverPageFixedList(),
        SliverPageGrid(),
      ],
    );
  }
}

class SliverPageList extends ConsumerWidget {
  const SliverPageList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Sliver List'),
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,

            ///show or hide when scrolling
            pinned: false,

            ///if unpined - show only at start or as soon as scrolling
            floating: true,

            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text('Flexible Space'),
              background: Image.asset(
                ImagePath.night,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 20,
              (context, index) {
                return ListTile(
                  title: Text('$index'),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class SliverPageFixedList extends ConsumerWidget {
  const SliverPageFixedList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double height = 100;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            stretchTriggerOffset: 300,
            stretch: true,
            title: Text('Sliver Fixed List'),
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,

            ///show or hide when scrolling
            pinned: false,

            ///if unpined - show only at start or as soon as scrolling
            floating: false,

            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text('Flexible Space'),
              background: Image.asset(
                ImagePath.night,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFixedExtentList.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  color: index.isEven ? AppColors.gradient1 : AppColors.gradient2,
                  child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      width: 100,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColors.white, boxShadow: const [
                        BoxShadow(blurRadius: 5, offset: Offset(0, 5)),
                        BoxShadow(offset: Offset(-5, 0), color: AppColors.white), //hiding left side of the shadow
                        BoxShadow(offset: Offset(5, 0), color: AppColors.white), //hiding right side of the shadow
                      ]),
                      child: Text('$height height')),
                );
              },
              itemExtent: height)
        ],
      ),
    );
  }
}

class SliverPageGrid extends ConsumerWidget {
  const SliverPageGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Sliver Grid extend / count'),
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,

            ///show or hide when scrolling
            pinned: false,

            ///if unpined - show only at start or as soon as scrolling
            floating: false,

            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text('Flexible Space'),
              background: Image.asset(
                ImagePath.night,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              childCount: 20,
              (context, index) {
                return Container(
                  alignment: Alignment.center,
                  color: AppColors.randomColor(),
                  child: Text('${index + 1}'),
                );
              },
            ),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 100),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              childCount: 10,
              (context, index) {
                return Container(
                  alignment: Alignment.center,
                  color: AppColors.randomColor(),
                  child: Text('${index + 100}'),
                );
              },
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
          ),
        ],
      ),
    );
  }
}
