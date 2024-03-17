import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../models/profile_menu_options.dart';

class ProfileListView extends StatefulWidget {
  const ProfileListView({super.key});

  @override
  State<ProfileListView> createState() => _ProfileListViewState();
}

class _ProfileListViewState extends State<ProfileListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: profileMenuOptions.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: SvgPicture.asset(profileMenuOptions[index].logo),
              title: Text(profileMenuOptions[index].text,),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => {debugPrint("${profileMenuOptions[index].text} has been pressed!")},
            );
          },
        ));
  }
}
