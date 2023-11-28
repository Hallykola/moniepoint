import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moniepointtest/calculate/views/calculate.dart';
import 'package:moniepointtest/main.dart';
import 'package:moniepointtest/profile/views/profile.dart';
import 'package:moniepointtest/theme/palette.dart';

import '../shipment/views/shipment_screen.dart';

BottomNavigationBar NavBar(context, {int? currentIndex}) {
  return BottomNavigationBar(
      onTap: (tab) {
        List<dynamic> screens = [
          HomePage.route(),
          Calculate.route(),

          ShipmentScreen.route(),

          ProfileScreen.route(),

          // Profile.route(),
          // Chat.route()
        ];
        Navigator.pushReplacement(context, screens[tab]);
      },
      selectedItemColor: Palette.tagGreen ,
      unselectedItemColor: Palette.grayTextColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(
        color: Palette.tagGreen,
        overflow: TextOverflow.visible,
      ),
      unselectedLabelStyle: TextStyle(
        color: Palette.tabBlue,
        overflow: TextOverflow.visible,
      ),
      currentIndex: currentIndex ?? 0,
      items: [
        BottomNavigationBarItem(
          // activeIcon: Image.asset(
          //   'assets/images/home.png',
          //   height: 20,
          //   color: Palette.grayTextColor,
          // ),
          label: 'Home',
          icon: Image.asset(
            'assets/images/home.png',
            height: 20,
            color: Palette.grayTextColor,
          ),
        ),
        BottomNavigationBarItem(
            // activeIcon: Image.asset(
            //   'assets/images/keys.png',
            //   height: 20,
            //   color: Palette.grayTextColor,
            // ),
            label: 'Calculate',
            icon: Image.asset(
              'assets/images/keys.png',
              height: 20,
              color: Palette.grayTextColor,
            )),
        BottomNavigationBarItem(
          // activeIcon: Image.asset(
          //   'assets/images/history.png',
          //   height: 20,
          //   color: Palette.grayTextColor,
          // ),
          label: 'Shipment',
          icon: Image.asset(
            'assets/images/history.png',
            height: 20,
            color: Palette.grayTextColor,
          ),
        ),
         BottomNavigationBarItem(
            // activeIcon: SvgPicture.asset(
            //   'assets/images/profile.svg',
            //   height: 20,
            //   color: Palette.grayTextColor,
            // ),
            label: 'Profile',
            icon: Icon(Icons.person)
            // SvgPicture.asset(
            //   'assets/images/profile.svg',
            //   height: 20,
            //   color: Palette.grayTextColor,
            // )
  ),
      ]);
}
