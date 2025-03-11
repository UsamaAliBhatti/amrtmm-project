import 'package:flutter/material.dart';

import '../../../../core/utils/res/appColors.dart';

class TagButton extends StatelessWidget {
  final String text;
  final Color color;
  const TagButton({
    super.key,
    required this.text,
    this.color = AppColors.button,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(25)),
      child: Text(
        text,
        style: TextStyle(fontSize: 12, color: color),
      ),
    );
  }
}
