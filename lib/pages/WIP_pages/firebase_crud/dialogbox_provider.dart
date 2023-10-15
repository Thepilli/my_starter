import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dialogbox_provider.g.dart';

@riverpod
class DialogboxText extends _$DialogboxText {
  @override
  String build() {
    return '';
  }

  void onChangeText(String value) {
    state = value;
  }
}

@riverpod
TextEditingController textController(TextControllerRef ref) {
  return TextEditingController();
}
