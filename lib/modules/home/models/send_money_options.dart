import 'package:pay_wallet/core/constants/app_resources.dart';
import 'package:pay_wallet/shared/widgets/multi_option_widget.dart';

final List<MultiOptionItem> sendMoneyOptions = [
  MultiOptionItem(AppResources.walletToWallet, 'Mobile Number'),
  MultiOptionItem(AppResources.bankTransfer, 'Bank'),
  MultiOptionItem(AppResources.paypalTransfer, 'Paypal'),
];
