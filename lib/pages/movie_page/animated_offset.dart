import 'package:flutter/material.dart';

typedef ChildBuilder = Widget Function(int index, BuildContext context);
typedef OnPageChangeCallback = void Function(int index);

class AnimatedOffset extends StatelessWidget {
  const AnimatedOffset({
    super.key,
    required this.pageController,
    required this.pageValue,
    required this.child,
    required this.pageCount,
    required this.onPageChangeCallback,
  });
  final PageController pageController;
  final double pageValue;
  final ChildBuilder child;
  final int pageCount;
  final OnPageChangeCallback onPageChangeCallback;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: pageCount,
      onPageChanged: onPageChangeCallback,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        //to offsett pages on the right side
        if (index == pageValue.floor() + 1 || index == pageValue.floor() + 2) {
          return Transform.translate(
            offset: Offset(
              0.0,
              100 * (index - pageValue),
            ),
            child: child(index, context),
          );
        } else if (index == pageValue.floor() - 1 || index == pageValue.floor()) {
          return Transform.translate(
            offset: Offset(
              0.0,
              100 * (pageValue - index),
            ),
            child: child(index, context),
          );
        } else {
          return child(index, context);
        }
      },
    );
  }
}
