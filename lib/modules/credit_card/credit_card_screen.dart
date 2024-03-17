import 'package:awesome_card/credit_card.dart';
import 'package:awesome_card/extra/card_type.dart';
import 'package:awesome_card/style/card_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pay_wallet/core/constants/app_colors.dart';
import 'package:pay_wallet/modules/credit_card/data/cards_data_demo.dart';
import 'package:pay_wallet/modules/credit_card/models/cardModel.dart';
import 'package:pay_wallet/modules/credit_card/widgets/credit_card_details.dart';
import 'package:pay_wallet/shared/services/formatingUtils.dart';

import '../../core/app_router.dart';
import '../../core/constants/app_resources.dart';
import '../../shared/widgets/action_button_1_widget.dart';
import '../../shared/widgets/dot_indicators.dart';
import '../../shared/widgets/multi_option_widget.dart';
import '../profile/models/profile_menu_options.dart';
import 'data/transactions_data_demo.dart';

class CreditCardScreen extends StatefulWidget {
  const CreditCardScreen({super.key});

  @override
  State<CreditCardScreen> createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  int selectedCard = 0;

  @override
  Widget build(BuildContext context) {
    double cardHeight = 210;

    return RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              creditCards(cardHeight),
              dotIndicators(),
              actionButtons(),
              recentTransactionsTitle(),
              transactionListView()
            ],
          ),
        ));
  }

  Widget creditCards(double cardHeight) {
    return Container(
      height: cardHeight,
      child: PageView.builder(
        itemCount: availableCards.length,
        controller: PageController(viewportFraction: 1),
        scrollDirection: Axis.horizontal,
        onPageChanged: _onCardChange,
        itemBuilder: (BuildContext context, int itemIndex) {
          return card(cardHeight, availableCards[itemIndex]);
        },
      ),
    );
  }

  Widget card(double cardHeight, CardModel cardModel) {
    return CreditCard(
        mask: cardModel.cardNumber,
        height: cardHeight,
        cardHolderName: cardModel.cardHolderName,
        bankName: "Payou",
        cardType: CardType.masterCard,
        frontBackground: CardBackgrounds.custom(AppColors.primaryColor.value),
        backBackground: CardBackgrounds.black,
        textExpDate: 'Exp. Date',
        textName: 'Name',
        textExpiry: 'MM/YY');
  }

  Widget dotIndicators() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: DotIndicators(
        selectedDot: selectedCard,
        dotsCount: availableCards.length,
      ),
    );
  }

  Widget actionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ActionButton1(
            text: 'Card Details',
            svgPath: AppResources.cardDetails,
            onButtonPress: () {
              debugPrint('[Card Details] Pressed!');
              AppRouter.showInModal(
                  context,
                  CardDetailsScreen(
                      cardHolderName: 'Alaa Jawhar',
                      cardNumber: availableCards[selectedCard].cardNumber,
                      expiryDate: '01/26',
                      cvv: '400'));
            }),
        ActionButton1(
            text: 'Card Settings',
            svgPath: AppResources.settings,
            onButtonPress: () {
              debugPrint('[Card Settings] Pressed!');
            }),
      ],
    );
  }

  _onCardChange(int page) {
    setState(() {
      selectedCard = page;
    });
  }

  Widget recentTransactionsTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 30, left: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Recent Transactions',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xCC19163D),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: SvgPicture.asset(
                AppResources.transactionFilter,
                height: 20,
                width: 20,
              ),
              onPressed: () {
                AppRouter.showInModal(context, Text("worked"));
              }),
        ],
      ),
    );
  }

  Widget transactionListView() {
    return Container(
        height: 300,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: transactionData.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: SvgPicture.asset(AppResources.cart),
              title: Text(
                formatString(transactionData[index].title),
              ),
              subtitle: Text(
                transactionData[index].type,
              ),
              trailing: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${formatDouble(transactionData[index].amount)}\$',
                    ),
                    Text(
                      formatDate(transactionData[index].date),
                    )
                  ],
                ),
              ),
              onTap: () => {
                debugPrint("${transactionData[index].title} has been pressed!")
              },
            );
          },
        ));
  }

  ShapeDecoration _customDecoration() {
    return ShapeDecoration(
      color: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      shadows: const [
        BoxShadow(
          color: AppColors.primaryColor,
          blurRadius: 20,
          offset: Offset(2, 4),
          spreadRadius: 2,
        )
      ],
    );
  }
}
