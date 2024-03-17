import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/app_router.dart';

class MultiOptionWidget extends StatefulWidget {
  final String title;
  final List<MultiOptionItem> options;

  const MultiOptionWidget(
      {super.key, required this.title, required this.options});

  @override
  State<MultiOptionWidget> createState() => _MultiOptionWidgetState();
}

class _MultiOptionWidgetState extends State<MultiOptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true, // Ensure it fits modal's height
                itemCount: widget.options.length,
                itemBuilder: (context, index) {
                  final option = widget.options[index];
                  return TextButton(
                    style: ElevatedButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                      foregroundColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                    ),
                    child: optionRowWidget(option),
                    onPressed: () {
                      debugPrint(
                          '[${widget.options[index].text}] has been pressed');
                    },
                  );
                },
              ),
            ],
          ),
        ));
  }

  Widget optionRowWidget(MultiOptionItem optionItem) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              optionItem.svgPath,
            ),
            const SizedBox(width: 10),
            Text(
              optionItem.text,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Divider(
            thickness: 1,
            color: Colors.black.withOpacity(0.2),
          ),
        )
      ],
    );
  }
}

class MultiOptionItem {
  final String svgPath;
  final String text;

  MultiOptionItem(this.svgPath, this.text);
}
