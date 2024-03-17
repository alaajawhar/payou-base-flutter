import '../../../core/constants/app_resources.dart';

final List<ServiceData> servicesData = [
  ServiceData('Electricity', AppResources.electricity, 0xFFFFF1F0),
  ServiceData('Wifi', AppResources.wifi, 0xFFE8FFF1),
  ServiceData('Hotel', AppResources.hotel, 0xFFFFF7E4),
  ServiceData('Subs', AppResources.wifi, 0xFFE8FFF1),
  ServiceData('Insurance', AppResources.insurance, 0xFFFFF1F0),
  ServiceData('Offers', AppResources.electricity, 0xFFFFF1F0),
  ServiceData('Escrow', AppResources.wifi, 0xFFFFF1F0),
  ServiceData('More', AppResources.more, 0xFFD1C2FF),
  // Add more rows as needed
];

class ServiceData {
  final String text;
  final String logo;
  final int backgroundColor;

  ServiceData(this.text, this.logo, this.backgroundColor);
}