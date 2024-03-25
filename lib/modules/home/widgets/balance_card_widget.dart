import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pay_wallet/core/app_router.dart';
import 'package:pay_wallet/shared/widgets/multi_option_widget.dart';

import '../../../shared/models/enums.dart';
import '../../../shared/utils/formatingUtils.dart';
import '../models/add_money_options.dart';

class BalanceCardWidget extends StatefulWidget {
  final double balance;
  final Currency currency;

  const BalanceCardWidget(
      {super.key, required this.balance, required this.currency});

  @override
  State<BalanceCardWidget> createState() => _BalanceCardWidgetState();
}

class _BalanceCardWidgetState extends State<BalanceCardWidget> {
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: colorScheme.primary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [balanceWidget(), const SizedBox(width: 20), qrAndTitle()],
        ));
  }

  Widget qrAndTitle() {
    return Column(
      children: [
        qr(),
        scanAndPayText(),
      ],
    );
  }

  Widget balanceWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        balanceText(),
        const SizedBox(height: 10),
        balanceTextValue(),
        const SizedBox(height: 10),
        addMoneyButton(),
      ],
    );
  }

  Widget balanceTextValue() {
    return Text(
      widget.currency.symbol + formatDouble(widget.balance),
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }

  Widget balanceText() {
    return Row(
      children: [
        const Padding(
            padding: EdgeInsets.only(right: 5),
            child: Icon(
              Icons.wallet_outlined,
              color: Colors.white,
            )),
        Text(
          widget.currency.label,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget addMoneyButton() {
    return ElevatedButton.icon(
      icon: const Icon(Icons.add_circle_outline),
      label: const Text('Add Money'),
      onPressed: () {
        debugPrint('[balanceCard.addMoney] has been pressed');
        AppRouter.showInModal(
            context,
            MultiOptionWidget(
              title: 'How do you want to add money?',
              options: addMoneyOptions,
            ));
      },
      style: ElevatedButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
        foregroundColor: Colors.white,
        backgroundColor: Colors.white24,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    );
  }

  Widget qr() {
    return InkWell(
      onTap: () {
        AppRouter.navigate(context, AppRouter.myQr);
      },
      child: SvgPicture.asset(
        'assets/test/qr.svg',
        height: 100,
        width: 100,
      ),
    );
  }

  Widget scanAndPayText() {
    return const Padding(
      padding: EdgeInsets.only(top: 10),
      child: Center(
        child: Text(
          'Scan & Pay',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
