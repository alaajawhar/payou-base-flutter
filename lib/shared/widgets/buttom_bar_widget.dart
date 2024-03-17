import 'package:flutter/material.dart';

class ButtomBarWidget extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const ButtomBarWidget({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  State<ButtomBarWidget> createState() => _ButtomBarWidgetState();
}

class _ButtomBarWidgetState extends State<ButtomBarWidget> {
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.credit_card),
          label: 'Cards',
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.store),
        //   label: 'Store',
        // ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: widget.selectedIndex,
      selectedItemColor: colorScheme.secondary,
      onTap: widget.onItemTapped,
    );
  }
}
