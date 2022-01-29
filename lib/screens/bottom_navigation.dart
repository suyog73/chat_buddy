// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:chat_buddy/helpers/constants.dart';
import 'package:chat_buddy/screens/chat/chat_user_screen.dart';
import 'package:chat_buddy/screens/users_screen/all_users_screen.dart';
import 'package:chat_buddy/screens/home_page.dart';
import 'package:chat_buddy/screens/setting_details/setting_screen.dart';
import 'package:chat_buddy/screens/users_screen/following_screen.dart';
import 'package:chat_buddy/screens/users_screen/users_screen.dart';
import 'package:chat_buddy/services/get_following.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  int _index = 2;
  List<Widget> screens = [
    HomePage(),
    HomePage(),
    ChatUserScreen(),
    UsersScreen(),
    SettingScreen(),
  ];

  void onItemTap(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
        height: 70,
        items: [
          Icon(
            FontAwesomeIcons.dailymotion,
            color: _index == 0 ? kLightBlueShadeColor : Colors.white,
            size: 32,
          ),
          Icon(
            Icons.lock_clock,
            color: _index == 1 ? kLightBlueShadeColor : Colors.white,
            size: 32,
          ),
          Icon(
            Icons.chat_outlined,
            color: _index == 2 ? kLightBlueShadeColor : Colors.white,
            size: 32,
          ),
          Icon(
            FontAwesomeIcons.users,
            color: _index == 3 ? kLightBlueShadeColor : Colors.white,
            size: 32,
          ),
          Icon(
            Icons.settings,
            color: _index == 4 ? kLightBlueShadeColor : Colors.white,
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
          child: screens[_index]),
    );
  }
}