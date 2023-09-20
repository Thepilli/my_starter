import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vertical_provider.g.dart';

@riverpod
class VerticalIndex extends _$VerticalIndex {
  @override
  int build() {
    return 0;
  }

  void setIndex(int index) {
    state = index;
  }
}
