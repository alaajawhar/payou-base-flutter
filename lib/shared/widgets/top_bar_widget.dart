import 'package:flutter/material.dart';

import 'logo_widget.dart';

class TopBarWidget extends StatefulWidget {
  final String title;

  const TopBarWidget({
    super.key,
    required this.title,
  });

  @override
  State<TopBarWidget> createState() => _TopBarWidgetState();
}

class _TopBarWidgetState extends State<TopBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const AppLogoWidget(),
      centerTitle: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {
            setState(() {
              debugPrint("[Notification] button has been pressed");
            });
          },
        )
      ],
    );
  }
}
