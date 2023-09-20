import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'date_provider.g.dart';

@riverpod
class SetToday extends _$SetToday {
  @override
  DateTime build() {
    return DateTime.now();
  }

  void setToday() {
    state = DateTime.now();
  }
}
