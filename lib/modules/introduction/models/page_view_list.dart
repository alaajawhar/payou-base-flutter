import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pay_wallet/core/constants/app_colors.dart';

const _fontFamily = '';
final List<PageViewModel> onboardingPageList = [
  PageViewModel(
    title: "Send Money Easily",
    body:
        "Send money instantly to anyone in your contacts. Fast, secure, and free transactions.",
    image: _buildImage('onboarding_image_1.svg'),
    decoration: pageDecoration,
  ),
  PageViewModel(
    title: "Manage Your Finances",
    body:
        "Take charge of your finances on the go. Track transactions, check balances from your mobile device.",
    image: _buildImage('onboarding_image_2.svg'),
    decoration: pageDecoration,
  ),
  PageViewModel(
    title: "Save Money",
    body:
        "Unlock smart and secure financial control in the palm of your hand. Start saving today!",
    image: _buildImage('onboarding_image_3.svg'),
    decoration: pageDecoration,
  ),
];

Widget _buildImage(String assetName) {
  return SvgPicture.asset(
    'assets/images/$assetName',
    height: 200,
  );
}

const pageDecoration = PageDecoration(
  titleTextStyle: TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.w700,
      color: AppColors.primaryColor),
  bodyTextStyle: TextStyle(fontSize: 16.0),
  pageColor: Colors.white,
  imagePadding: EdgeInsets.zero,
);
