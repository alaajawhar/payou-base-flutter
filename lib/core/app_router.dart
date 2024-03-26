import 'package:get/get.dart';
import 'package:pay_wallet/shared/widgets/app_home.dart';

import '../modules/authorization/views/otp_verification_screen.dart';
import '../modules/authorization/views/set_password_screen.dart';
import '../modules/authorization/views/signin_screen.dart';
import '../modules/authorization/views/signup_screen.dart';
import '../modules/credit_card/card_settings_screen.dart';

class AppRouter {
  static String home = '/home';
  static String signUp = '/signup';
  static String signIn = '/signin';
  static String setPassword = '/setPassword';
  static String hotel = '/hotel';
  static String userValidationScreen = '/user-validation';
  static String myQr = '/my-qr';
  static String otpVerification = '/otpVerification';
  static String cardSettings = '/cardSettings';

  static List<GetPage> getPages = [
    GetPage(name: home, page: () => const AppHome()),
    GetPage(name: signUp, page: () => const SignUpScreen()),
    GetPage(name: signIn, page: () => const SingInScreen()),
    GetPage(name: setPassword, page: () => const SetPasswordScreen()),
    GetPage(name: otpVerification, page: () => const OtpVerificationScreen()),
    GetPage(name: cardSettings, page: () => const CardSettingsScreen()),
  ];
}
