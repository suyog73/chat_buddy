// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:chat_buddy/helpers/constants.dart';
import 'package:chat_buddy/models/user_model.dart';
import 'package:chat_buddy/screens/chat/chat_user_screen.dart';
import 'package:chat_buddy/screens/setting_details/setting_screen.dart';
import 'package:chat_buddy/screens/users_screen/users_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key, this.idx = -1}) : super(key: key);

  final int idx;

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  int _index = 1;
  List<Widget> screens = [
    UsersScreen(),
    ChatUserScreen(),
    SettingScreen(),
  ];

  void onItemTap(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  void initState() {
    if (widget.idx != -1) _index = widget.idx;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Current User:${UserModel.fullName} : ${UserModel.uid}");

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: kBlueShadeColor,
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.grey.withOpacity(0.3),
        buttonBackgroundColor: Colors.transparent,
        backgroundColor: kBlueShadeColor,
        key: _bottomNavigationKey,
        index: _index,
        height: 65,
        items: [
          Icon(
            FontAwesomeIcons.users,
            color: _index == 0 ? kLightBlueShadeColor : Colors.white,
            size: 32,
          ),
          Icon(
            Icons.chat_outlined,
            color: _index == 1 ? kLightBlueShadeColor : Colors.white,
            size: 32,
          ),
          Icon(
            Icons.settings,
            color: _index == 2 ? kLightBlueShadeColor : Colors.white,
            size: 32,
          ),
        ],
        onTap: (index) => setState(() {
          onItemTap(index);
        }),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: screens[_index],
      ),
    );
  }
}
