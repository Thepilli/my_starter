import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'spin_provider.g.dart';

@riverpod
class Spin extends _$Spin {
  @override
  double build() {
    return .0;
  }

  void fullspin() {
    state = state += .5;
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        state = state += .5;
      },
    );
  }

  void halfspin() {
    state = state += .5;
  }
}

@riverpod
class PickedBoard extends _$PickedBoard {
  @override
  int build() {
    return 0;
  }

  void pickBoard(int index) {
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        state = index;
      },
    );
  }
}
