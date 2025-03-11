import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ContainerDescItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final double fontSize;
  final double iconSize;
  final Color iconColor;
  final Color textColor;
  const ContainerDescItem({
    super.key,
    required this.icon,
    required this.title,
    this.fontSize = 14,
    this.iconSize = 24,
    this.iconColor = Colors.grey,
    this.textColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
        const Gap(5),
        Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}
