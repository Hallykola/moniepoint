import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moniepointtest/calculate/views/calculate.dart';
import 'package:moniepointtest/theme/palette.dart';

class ProfileScreen extends StatefulWidget {
  static MaterialPageRoute<dynamic> route() => MaterialPageRoute(
    builder: (builder) => const ProfileScreen(),
  );
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  int? selectedChip;

  @override
  Widget build(BuildContext context) {
    return Sceenframe(content: buildContentContainer(),title:'Profile');
  }

  Container buildContentContainer() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Palette.white,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          
          children: [
            Center(child: Text('Page not included in video', textAlign: TextAlign.center, style: TextStyle(color: Palette.logoutRed, fontSize: 20),))
          ],
        ),
      ),
    );
  }
}