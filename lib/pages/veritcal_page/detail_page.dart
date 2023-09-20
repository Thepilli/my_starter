import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:starter_kit/app/app_colors.dart';
import 'package:starter_kit/app/app_constants.dart';
import 'package:starter_kit/pages/veritcal_page/date_provider.dart';
import 'package:starter_kit/pages/veritcal_page/veritcal_page.dart';
import 'package:starter_kit/shared/extensions/build_context.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(30)),
                  height: context.sizeHeight * .5,
                  width: context.sizeWidth,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.circle_notifications_outlined),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.calendar_month_outlined),
                              ),
                            ],
                          ),
                          ListTile(
                            title: const Text('PLANT NAME'),
                            subtitle: Text('Added ${DateFormat.yMMMd().format(DateTime.now())}'),
                          ),
                          IndicatorCol(
                              indicatorValue: '77%',
                              indicatorName: 'Humidity',
                              fontSizeTop: 22,
                              fontSizeBottom: 16,
                              iconData: Icons.water_drop_outlined,
                              iconColor: context.primary),
                          IndicatorCol(
                              indicatorValue: '23*C',
                              indicatorName: 'Temperature',
                              fontSizeTop: 22,
                              fontSizeBottom: 16,
                              iconData: Icons.thermostat_outlined,
                              iconColor: context.primary),
                          IndicatorCol(
                              indicatorValue: '77%',
                              indicatorName: 'SunLight',
                              fontSizeTop: 22,
                              fontSizeBottom: 16,
                              iconData: Icons.light_mode,
                              iconColor: context.primary),
                        ],
                      ),
                      Positioned(
                        bottom: 0,
                        right: -50,
                        child: Image.asset(
                          ImagePath.bonsai,
                          height: 300,
                          width: 200,
                        ),
                      )
                    ],
                  )),
              Stack(
                children: [
                  AnimatedContainer(
                    alignment: Alignment.bottomCenter,
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(horizontal: 21, vertical: 10),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(color: AppColors.black, borderRadius: BorderRadius.circular(30)),
                    height: context.sizeHeight * .3,
                    width: context.sizeWidth,
                    child: Text(
                      'Watering',
                      style: context.textTheme.labelMedium,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(30)),
                    height: context.sizeHeight * .25,
                    width: context.sizeWidth,
                    child: Column(
                      children: [
                        ListTile(
                          leading: GestureDetector(
                            onTap: () {
                              ref.read(setTodayProvider.notifier).setToday();
                            },
                            child: Text(
                              'Pick\nToday',
                              style: context.textTheme.bodySmall?.copyWith(color: context.primary),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          title: const Text('Watering schedule'),
                          subtitle: Text(DateFormat.yMMMMd().format(DateTime.now())),
                          trailing: CircularPercentIndicator(
                              percent: .4,
                              progressColor: context.primary,
                              center: Icon(
                                Icons.water_drop_outlined,
                                color: context.primary,
                              ),
                              radius: 25),
                        ),
                        CalendarTimeline(
                          shrink: true,
                          initialDate: ref.watch(setTodayProvider),
                          firstDate: DateTime.now().subtract(const Duration(days: 30)),
                          lastDate: DateTime(2024, 11, 20),
                          onDateSelected: (date) => print(date),
                          leftMargin: 20,
                          monthColor: Colors.blueGrey,
                          dayColor: Colors.teal[200],
                          activeBackgroundDayColor: context.primary,
                          selectableDayPredicate: (date) => date.day != 23,
                          locale: 'en_ISO',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
