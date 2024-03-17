import 'package:flutter/material.dart';
import 'package:pay_wallet/modules/onboarding/otp_verification_screen.dart';
import 'package:pay_wallet/modules/onboarding/sign_in.dart';
import 'package:pay_wallet/modules/onboarding/signup_screen.dart';
import 'package:pay_wallet/modules/qr/my_qr_screen.dart';
import 'package:pay_wallet/shared/widgets/app_home.dart';

import '../modules/home/models/add_money_options.dart';
import '../shared/widgets/multi_option_widget.dart';

class AppRouter {
  static String home = 'home';
  static String signUp = 'signup';
  static String hotel = 'hotel';
  static String userValidationScreen = 'user-validation';
  static String myQr = 'my-qr';
  static String otpVerification = 'otpVerification';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const AppHome(),
    hotel: (context) => MultiOptionWidget(title: 'sd', options: addMoneyOptions),
    userValidationScreen: (context) => const SingInScreen(),
    myQr: (context) => const MyQrScreen(),
    signUp: (context) => const SignUpScreen(),
    otpVerification: (context) => const OtpVerificationScreen(),
  };

  static navigate(BuildContext context, String routerLink) {
    Navigator.of(context).pushNamed(routerLink);
  }

  static navigateWithClearStack(BuildContext context, String routerLink) {
    Navigator.pushNamedAndRemoveUntil(context, routerLink, (r) => false);
  }

  static showInModal(BuildContext context, Widget widget) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        builder: (buildContext) => widget);
  }
}
