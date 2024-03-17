import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pay_wallet/core/constants/app_resources.dart';
import 'package:pay_wallet/shared/widgets/divider_widget.dart';

class CardDetailsScreen extends StatefulWidget {
  final String cardHolderName;
  final String cardNumber;
  final String expiryDate;
  final String cvv;

  const CardDetailsScreen(
      {super.key,
      required this.cardHolderName,
      required this.cardNumber,
      required this.expiryDate,
      required this.cvv});

  @override
  State<CardDetailsScreen> createState() => _CardDetailsScreenState();
}

class _CardDetailsScreenState extends State<CardDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title("Card Details"),
            _textFieldWithCopyButton('Card Number', widget.cardNumber),
            _textFieldButton('Card Holder Name', widget.cardHolderName),
            Row(
              children: [
                _textFieldButton('CVV', widget.cvv),
                _textFieldButton('Expiry Date', widget.expiryDate),
              ],
            )
          ],
        ));
  }

  Widget _title(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _textFieldButton(String label, String text) {
    return TextButton(
      style: ElevatedButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
        foregroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      child: _textField(label, text),
      onPressed: () {
        debugPrint('[] has been pressed');
      },
    );
  }

  Widget _textFieldWithCopyButton(String label, String text) {
    return TextButton(
      style: ElevatedButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
        foregroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      child: textFieldWithCopyIcon(label, text),
      onPressed: () {
        debugPrint('[] has been pressed');
      },
    );
  }

  Widget textFieldWithCopyIcon(String label, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 3),
          child: _label(label),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            SvgPicture.asset(
              AppResources.cardDetails,
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 5),
          child: CustomDivider(),
        )
      ],
    );
  }

  Widget _textField(String label, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: _label(label),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 3),
          child: CustomDivider(),
        )
      ],
    );
  }

  Widget _label(String labelValue) {
    return Text(
      labelValue,
      style: TextStyle(
        color: Colors.black.withOpacity(0.4),
      ),
    );
  }
}
