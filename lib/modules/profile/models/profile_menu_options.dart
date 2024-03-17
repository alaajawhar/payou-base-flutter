

final List<ProfileMenuOptionItem> profileMenuOptions = [
  ProfileMenuOptionItem('assets/icons/language.svg', 'Language', ''),
  ProfileMenuOptionItem('assets/icons/biometric.svg', 'Biometric', ''),
  ProfileMenuOptionItem(
      'assets/icons/change-mobile-number.svg', 'Change Mobile Number', ''),
  ProfileMenuOptionItem('assets/icons/logout.svg', 'Logout', '')
];

class ProfileMenuOptionItem {
  final String logo;
  final String text;
  final String subText;

  ProfileMenuOptionItem(this.logo, this.text, this.subText);
}
