import 'package:flutter/material.dart';
import 'package:pay_wallet/modules/home/models/deposit_money_options.dart';
import 'package:pay_wallet/modules/home/models/send_money_options.dart';

import '../../../core/constants/app_resources.dart';
import '../../../shared/decorations/custom_showModal.dart';
import '../../../shared/widgets/action_button_1_widget.dart';
import '../../../shared/widgets/multi_option_widget.dart';

class accountActionButtons extends StatefulWidget {
  const accountActionButtons({super.key});

  @override
  State<accountActionButtons> createState() =>
      _accountActionButtonsState();
}

class _accountActionButtonsState extends State<accountActionButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ActionButton1(text: 'Send',
              svgPath: AppResources.sendMoney,
              onButtonPress: () {
                debugPrint('[Send Button] Pressed!');
                CustomShowModal.showInModal(MultiOptionWidget(
                  title: 'How do you want to send money?',
                  options: sendMoneyOptions,
                ));
              }),
          ActionButton1(text: 'Receive',
              svgPath: AppResources.depositMoney,
              onButtonPress: () {
                debugPrint('[Deposit Button] Pressed!');
                CustomShowModal.showInModal(MultiOptionWidget(
                  title: 'How do you want to deposit money?',
                  options: depositMoneyOptions,
                ));
              }),
          ActionButton1(text: 'History',
              svgPath: AppResources.transactionHistory,
              onButtonPress: () {
                debugPrint('[History Button] Pressed!');
              }),
          ActionButton1(
              text: 'Account', svgPath: AppResources.help, onButtonPress: () {
            debugPrint('[Help Button] Pressed!');
          }),
        ],
      ),
    );
  }
}
