import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pay_wallet/modules/home/widgets/balance_card_widget.dart';
import 'package:pay_wallet/modules/home/widgets/main_action_buttons_widget.dart';
import 'package:pay_wallet/modules/home/widgets/service_widget.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:pay_wallet/shared/widgets/dot_indicators.dart';

import '../../core/constants/app_colors.dart';
import '../../shared/models/enums.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedAccount = 0;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              accounts(),
              dotIndicators(),
              accountActionButtons(),
              services()
            ],
          ),
        ));
  }

  Widget accounts() {
    return Container(
      height: 210,
      child: PageView(
        scrollDirection: Axis.horizontal,
        onPageChanged: _onPageViewChange,
        children: const [
          BalanceCardWidget(
            balance: 1603.25,
            currency: Currency.usd,
          ),
          BalanceCardWidget(
            balance: 18730.25,
            currency: Currency.lbp,
          ),
          BalanceCardWidget(
            balance: 43.25,
            currency: Currency.saving,
          ),
        ],
      ),
    );
  }

  Widget dotIndicators() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: DotIndicators(selectedDot: selectedAccount, dotsCount: 3),
    );
  }

  _onPageViewChange(int page) {
    setState(() {
      selectedAccount = page;
    });
  }
}
