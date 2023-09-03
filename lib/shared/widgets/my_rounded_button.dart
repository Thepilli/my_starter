import 'package:flutter/material.dart';
import 'package:starter_kit/shared/extensions/build_context.dart';

import '../../app/app_colors.dart';

class MyRoundedButton extends StatelessWidget {
  final Color? color;
  final bool withBorder;
  final String label;
  const MyRoundedButton({
    super.key,
    required this.label,
    this.color,
    this.withBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color,
          border: withBorder ? Border.all(color: context.primary, width: 2) : null),
      child: Text(
        label,
        style: context.textTheme.titleMedium?.copyWith(color: AppColors.white),
      ),
    );
  }
}
