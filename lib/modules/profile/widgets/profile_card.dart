import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/services/formatingUtils.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({super.key});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            pictureAndText(),
            const SizedBox(width: 20),
            nameAndMobileNumber()
          ],
        ));
  }

  Widget nameAndMobileNumber() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          formatString('Test User'),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
        Text(formatString('+961 71-785792'),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 0,
            )),
      ],
    );
  }

  Widget pictureAndText() {
    return Column(
      children: [
        picture(),
        editText(),
      ],
    );
  }

  Widget picture() {
    return SvgPicture.asset(
      'assets/test/user-icon.svg',
      height: 100,
      width: 100,
    );
  }

  Widget editText() {
    return const Padding(
      padding: EdgeInsets.only(top: 10),
      child: Center(
        child: Text(
          'Edit',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget nameAndLastName() {
    return Text(
      'Hakuna matata',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        height: 0,
      ),
    );
  }
}
