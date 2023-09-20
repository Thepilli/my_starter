// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:starter_kit/app/app_colors.dart';
import 'package:starter_kit/app/app_constants.dart';
import 'package:starter_kit/pages/veritcal_page/calendar_page.dart';
import 'package:starter_kit/pages/veritcal_page/vertical_provider.dart';
import 'package:starter_kit/router/app_router.dart';
import 'package:starter_kit/shared/extensions/build_context.dart';

class VerticalPage extends ConsumerWidget {
  VerticalPage({super.key});

  final List pages = [
    'Schedule',
    'Plants',
    'Articles',
    'Stores',
  ];
  final List<Widget> page = [
    CalendarPage(),
    PlantListView(),
    Container(),
    Container(),
  ];
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var currentIndex = ref.watch(verticalIndexProvider);
    return Scaffold(
      body: Stack(
        children: [
          Sidebar(pages: pages, currentIndex: currentIndex, pageController: pageController),
          Positioned(
            right: 0,
            child: Container(
              height: context.sizeHeight,
              width: context.sizeWidth * .8,
              decoration: BoxDecoration(
                color: context.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                ),
              ),
              child: PageView(
                controller: pageController,
                onPageChanged: (value) => ref.read(verticalIndexProvider.notifier).setIndex(value),
                children: page,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  const Sidebar({
    super.key,
    required this.pages,
    required this.currentIndex,
    required this.pageController,
  });

  final List pages;
  final int currentIndex;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      child: Container(
        height: context.sizeHeight,
        width: context.sizeWidth * .5,
        decoration: const BoxDecoration(color: AppColors.black),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 50, 15, 0),
              child: CircleAvatar(
                foregroundImage: AssetImage(ImagePath.avatar),
              ),
            ),
            Expanded(
              child: SidebarWithIndicator(
                pages: pages,
                currentIndex: currentIndex,
                pageController: pageController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlantListView extends StatelessWidget {
  const PlantListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 40, 15, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'All Plants',
                style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              Icon(Icons.filter_list),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return PlantCard();
            },
          ),
        ),
      ],
    );
  }
}

class PlantCard extends StatelessWidget {
  const PlantCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.detail.name);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        padding: const EdgeInsets.all(20),
        height: context.sizeWidth * .8,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: AppColors.white),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  ImagePath.bonsai,
                  height: 200,
                  width: 200,
                ),
                Text(
                  'PLANT NAME',
                  style: context.textTheme.titleSmall,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IndicatorCol(
                        indicatorValue: '77%',
                        indicatorName: 'Humidity',
                        iconData: Icons.water_drop_outlined,
                        iconColor: context.primary),
                    IndicatorCol(
                        indicatorValue: '77*C',
                        indicatorName: 'Temperature',
                        iconData: Icons.thermostat_outlined,
                        iconColor: context.primary),
                    IndicatorCol(
                        indicatorValue: '77%', indicatorName: 'SunLight', iconData: Icons.light_mode, iconColor: context.primary),
                  ],
                ),
              ],
            ),
            Positioned(
              top: -10,
              right: -10,
              child: CircularPercentIndicator(
                  percent: .4,
                  progressColor: context.primary,
                  center: Icon(
                    Icons.water_drop_outlined,
                    color: context.primary,
                  ),
                  radius: 25),
            ),
          ],
        ),
      ),
    );
  }
}

class SidebarWithIndicator extends ConsumerWidget {
  const SidebarWithIndicator({
    super.key,
    required this.pages,
    required this.currentIndex,
    required this.pageController,
  });

  final List pages;
  final int currentIndex;
  final PageController pageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            ref.read(verticalIndexProvider.notifier).setIndex(index);
            pageController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.linear);
          },
          child: RotatedBox(
            quarterTurns: 3,
            child: Container(
              padding: const EdgeInsets.only(right: 80, top: 20),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    pages[index],
                    style: context.textTheme.labelMedium?.copyWith(color: currentIndex == index ? context.primary : null),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.all(10),
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(99),
                        color: currentIndex == index ? context.primary : Colors.transparent),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 100,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(99),
                        color: currentIndex == index ? context.background : Colors.transparent),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class IndicatorCol extends StatelessWidget {
  final String indicatorValue;
  final String indicatorName;
  final IconData iconData;
  final Color? iconColor;
  final double fontSizeTop;
  final double fontSizeBottom;
  const IndicatorCol({
    super.key,
    required this.indicatorValue,
    required this.indicatorName,
    required this.iconData,
    this.iconColor = AppColors.grey,
    this.fontSizeTop = 16,
    this.fontSizeBottom = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                iconData,
                color: iconColor,
              ),
              Text(
                indicatorValue,
                style: context.textTheme.bodyLarge?.copyWith(fontSize: fontSizeTop, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Text(
            indicatorName,
            style: context.textTheme.bodySmall?.copyWith(fontSize: fontSizeBottom),
          ),
        ],
      ),
    );
  }
}
