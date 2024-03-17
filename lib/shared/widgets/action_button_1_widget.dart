import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActionButton1 extends StatefulWidget {
  final String text;
  final String svgPath;
  final VoidCallback onButtonPress;

  const ActionButton1(
      {super.key,
      required this.text,
      required this.svgPath,
      required this.onButtonPress});

  @override
  State<ActionButton1> createState() => _ActionButton1State();
}

class _ActionButton1State extends State<ActionButton1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: Container(
              width: 50,
              height: 50,
              decoration: customDecoration(),
              padding: const EdgeInsets.all(10),
              child: svgFromPath(widget.svgPath),
            ),
            onPressed: widget.onButtonPress),
        Text(
          widget.text,
          style: const TextStyle(fontWeight: FontWeight.w500),
        )
      ],
    );
  }

  ShapeDecoration customDecoration() {
    return ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      shadows: const [
        BoxShadow(
          color: Color(0x26343EE0),
          blurRadius: 20,
          offset: Offset(2, 4),
          spreadRadius: 2,
        )
      ],
    );
  }

  Widget svgFromPath(String svgPath) {
    return SvgPicture.asset(
      svgPath,
      height: 100,
      width: 100,
    );
  }
}
