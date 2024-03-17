import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActionButton2 extends StatefulWidget {
  final String text;
  final String logo;
  final int backgroundColor;
  final VoidCallback onItemTapped;

  const ActionButton2(
      {super.key,
      required this.text,
      required this.logo,
      required this.backgroundColor,
      required this.onItemTapped});

  @override
  State<ActionButton2> createState() => _ActionButton2State();
}

class _ActionButton2State extends State<ActionButton2> {
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
              padding: const EdgeInsets.all(10),
              decoration: ShapeDecoration(
                color: Color(widget.backgroundColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: svgFromPath(widget.logo),
            ),
            onPressed: widget.onItemTapped),
        Text(
          widget.text,
          style: const TextStyle(fontWeight: FontWeight.w500),
        )
      ],
    );
  }

  Widget svgFromPath(String svgPath) {
    return SvgPicture.asset(svgPath,);
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
}
