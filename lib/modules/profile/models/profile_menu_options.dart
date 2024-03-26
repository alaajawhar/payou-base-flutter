import 'dart:ui';

import 'package:pay_wallet/core/constants/app_resources.dart';

final List<ProfileMenuOptionItem> profileMenuOptions = [
  ProfileMenuOptionItem(AppResources.changeLanguageIcon, 'Language', '', () {}),
  ProfileMenuOptionItem(AppResources.biometricIcon, 'Biometric', '', () {}),
  ProfileMenuOptionItem(
      AppResources.changeMobileNumberIcon, 'Change Mobile Number', '', () {}),
  ProfileMenuOptionItem(AppResources.logoutIcon, 'Logout', '', () {})
];

class ProfileMenuOptionItem {
  final String logo;
  final String text;
  final String subText;
  final VoidCallback onTap;

  ProfileMenuOptionItem(this.logo, this.text, this.subText, this.onTap);
}
