import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'animation_trigger.g.dart';

@riverpod
class Trigger extends _$Trigger {
  @override
  bool build() {
    return true;
  }

  void switcher() {
    state = !state;
  }
}
