import 'package:flutter/material.dart';
import 'package:pay_wallet/core/constants/app_config.dart';

import '../../core/constants/app_colors.dart';

class AppLogoWidget extends StatelessWidget {
  final double fontSize;

  const AppLogoWidget({super.key, this.fontSize = 24.0});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(
            text: AppConfig.pay,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
              fontSize: fontSize,
            ),
          ),
          TextSpan(
            text: AppConfig.ou,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.secondaryColor,
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
