import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pay_wallet/core/constants/app_colors.dart';

import '../../core/app_router.dart';
import 'models/page_view_list.dart';

class IntroductionView extends StatefulWidget {
  const IntroductionView({super.key});

  @override
  State<IntroductionView> createState() => _IntroductionViewState();
}

class _IntroductionViewState extends State<IntroductionView> {
  final double _footerHeight = 50;

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      pages: onboardingPageList,
      showSkipButton: false,
      showBackButton: true,
      nextStyle: TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
      backStyle: TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
      doneStyle: TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
      next: _next(),
      back: const Icon(Icons.arrow_back_ios_sharp),
      done: _done(),
      onDone: () {
        Get.offAllNamed(AppRouter.signIn, arguments: 'Your data here');
      },
      dotsDecorator: _dotsDecorator(),
    );
  }

  DotsDecorator _dotsDecorator() {
    return DotsDecorator(
      size: const Size.square(10.0),
      activeSize: const Size(20.0, 10.0),
      activeColor: Theme.of(context).colorScheme.secondary,
      color: Colors.black26,
      spacing: const EdgeInsets.symmetric(horizontal: 3.0),
      activeShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
    );
  }

  Widget _next() {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    var icon = const Icon(
      Icons.arrow_forward_ios_sharp,
      color: AppColors.whiteColor,
    );

    return Container(
        height: _footerHeight,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colorScheme.primary,
        ),
        child: icon);
  }

  Widget _done() {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    var text = const Text("Done",
        style: TextStyle(
            fontWeight: FontWeight.w700, color: AppColors.whiteColor));

    return Container(
        height: _footerHeight,
        width: 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: colorScheme.primary,
          borderRadius: const BorderRadius.all(Radius.circular(50.0)),
        ),
        child: text);
  }
}
