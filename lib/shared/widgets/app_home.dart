
import 'package:flutter/material.dart';
import 'package:pay_wallet/modules/credit_card/credit_card_screen.dart';
import 'package:pay_wallet/modules/home/home_screen.dart';
import 'package:pay_wallet/modules/profile/profile_screen.dart';

import 'top_bar_widget.dart';
import 'buttom_bar_widget.dart';

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    CreditCardScreen(),
    // Text('Store', textAlign: TextAlign.center),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;


    return Scaffold(
      appBar: AppBar(
        title: const TopBarWidget(title: "title",),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: ButtomBarWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
