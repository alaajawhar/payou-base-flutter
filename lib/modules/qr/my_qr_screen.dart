import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyQrScreen extends StatefulWidget {
  const MyQrScreen({super.key});

  @override
  State<MyQrScreen> createState() => _MyQrScreenState();
}

class _MyQrScreenState extends State<MyQrScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.black,
              child: qr(),
            ),
            scanAndPayText(),
          ],
        ),
      )
    );
  }

  Widget qrAndTitle() {
    return Column(
      children: [
        qr(),
        scanAndPayText(),
      ],
    );
  }

  Widget qr() {
    return SvgPicture.asset(
      'assets/test/qr.svg',
      height: 100,
      width: 100,
    );
  }

  Widget scanAndPayText() {
    return const Padding(
      padding: EdgeInsets.only(top: 10),
      child: Center(
        child: Text(
          'Scan & Pay',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
