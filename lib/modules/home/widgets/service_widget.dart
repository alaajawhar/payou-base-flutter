import 'package:flutter/material.dart';

import '../../../core/constants/app_resources.dart';
import '../../../core/app_router.dart';
import '../../../shared/widgets/action_button_2_widget.dart';
import '../models/available_services.dart';

class services extends StatefulWidget {
  const services({super.key});

  @override
  State<services> createState() => _servicesState();
}

class _servicesState extends State<services> {
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: colorScheme.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(60),
      ),
      constraints: const BoxConstraints(
        minHeight: 400.0, // Set your desired minimum height
      ),
      child: Column(
        children: [
          Text(
            'Services',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: colorScheme.primary,
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
          for (int i = 0; i < servicesData.length; i += 4)
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (int j = i; j < i + 4 && j < servicesData.length; j++)
                      ActionButton2(
                        text: servicesData[j].text,
                        logo: servicesData[j].logo,
                        backgroundColor: servicesData[j].backgroundColor,
                        onItemTapped: () => {
                          AppRouter.navigate(context, AppRouter.hotel)
                        },
                      ),
                    for (int k = 0; k < 4 - (servicesData.length - i); k++)
                      emptySizeBoxWithSameWidthOfActionButton2()
                    // Adjust the width as needed
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
        ],
      ),
    );
  }

  Widget emptySizeBoxWithSameWidthOfActionButton2() {
    return SizedBox(height: 50, width: 50);
  }
}
