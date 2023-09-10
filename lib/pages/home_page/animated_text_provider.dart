import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'animated_text_provider.g.dart';

@riverpod
class AnimeText extends _$AnimeText {
  @override
  bool build() {
    return false;
  }

  void expandToggle(bool isExpanded) {
    state = !isExpanded;
  }
}
