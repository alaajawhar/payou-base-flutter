import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/app_router.dart';
import 'core/constants/app_colors.dart';
import 'core/constants/app_config.dart';
import 'modules/introduction/introduction_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return MaterialApp(
      debugShowCheckedModeBanner: AppConfig.isDebugApp,
      // TODO: unify the below in a single file (similar to: https://gist.github.com/sumonb/cf54c15f779558fb7a6ad0b51e02ea9f)
      theme: payouThemeData(),
      routes: AppRouter.routes,
      home: const IntroductionView(),
    );
  }

  ThemeData payouThemeData() {
    return ThemeData(
      fontFamily: 'Poppins',
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.seedColor,
          primary: AppColors.primaryColor,
          secondary: AppColors.secondaryColor),
    );
  }
}
