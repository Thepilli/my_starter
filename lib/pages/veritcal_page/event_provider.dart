import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:starter_kit/pages/veritcal_page/event_model.dart';

part 'event_provider.g.dart';

@riverpod
class EventRepository extends _$EventRepository {
  @override
  Map<DateTime, List<Event>> build() {
    return {};
  }

  Map<DateTime, List<Event>> addEvent(DateTime selectedDate, String event) {
    final events = state;
    final updatedMap = events
      ..addAll({
        selectedDate: [Event(title: event)]
      });
    return updatedMap;
  }

  List<Event> getEventsForDay(DateTime day) {
    return state[day] ?? [];
  }
}

@riverpod
class SelectedDate extends _$SelectedDate {
  @override
  List<DateTime> build() {
    return [DateTime.now(), DateTime.now()];
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    state = [selectedDay, focusedDay];
  }
}
