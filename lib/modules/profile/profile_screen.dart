import 'package:flutter/material.dart';
import 'package:pay_wallet/modules/profile/widgets/profile_card.dart';
import 'package:pay_wallet/modules/profile/widgets/profile_list_view.dart';

import '../../shared/models/enums.dart';
import '../home/widgets/balance_card_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedAccount = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfileCard(),
          ProfileListView()
        ],
      ),
    );
  }
}
