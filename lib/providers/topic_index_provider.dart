import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'topic_index_provider.g.dart';

@riverpod
class TopicIndex extends _$TopicIndex {
  @override
  int build() {
    return 0;
  }

  void onTap(int index) {
    state = index;
  }
}
