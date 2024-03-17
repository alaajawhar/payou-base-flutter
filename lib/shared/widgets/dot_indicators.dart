import 'package:flutter/material.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

import '../../core/constants/app_colors.dart';

class DotIndicators extends StatefulWidget {
  final int selectedDot;
  final int dotsCount;

  const DotIndicators({super.key,
    required this.selectedDot,
    required this.dotsCount,
  });

  @override
  State<DotIndicators> createState() => _DotIndicatorsState();
}

class _DotIndicatorsState extends State<DotIndicators> {
  @override
  Widget build(BuildContext context) {
    return PageViewDotIndicator(
      currentItem: widget.selectedDot,
      count: widget.dotsCount,
      unselectedColor: Colors.black26,
      selectedColor: AppColors.secondaryColor,
      size: const Size(8, 8),
      unselectedSize: const Size(8, 8),
    );
  }
}
