// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:starter_kit/pages/veritcal_page/event_model.dart';
import 'package:starter_kit/pages/veritcal_page/event_provider.dart';
import 'package:starter_kit/shared/extensions/build_context.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends ConsumerWidget {
  CalendarPage({super.key});

  final TextEditingController eventTextController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(selectedDateProvider);
    DateTime selectedDay = state.first;
    DateTime focusedDay = state.last;

    Map<DateTime, List<Event>> events = ref.watch(eventRepositoryProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
                scrollable: true,
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        ref.read(eventRepositoryProvider.notifier).addEvent(selectedDay, eventTextController.text);
                      },
                      child: Text('submit')),
                  ElevatedButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text('back'))
                ],
                title: Text('EventName'),
                content: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: eventTextController,
                  ),
                )),
          );
        },
      ),
      body: TableCalendar(
        calendarBuilders: CalendarBuilders(
          markerBuilder: (context, day, events) => events.isNotEmpty ? Icon(Icons.water_drop) : null,
        ),
        calendarStyle: CalendarStyle(
          cellPadding: EdgeInsets.symmetric(vertical: 8),
          cellAlignment: Alignment.topCenter,
          todayDecoration: BoxDecoration(border: Border.all(color: context.primary)),
          selectedDecoration: BoxDecoration(color: context.primary),
        ),
        selectedDayPredicate: (day) => isSameDay(selectedDay, day),
        rowHeight: 80,
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        eventLoader: (day) => ref.read(eventRepositoryProvider.notifier).getEventsForDay(day),
        focusedDay: focusedDay,
        onDaySelected: (selectedDay, focusedDay) =>
            ref.read(selectedDateProvider.notifier).onDaySelected(selectedDay, focusedDay),
      ),
    );
  }
}
