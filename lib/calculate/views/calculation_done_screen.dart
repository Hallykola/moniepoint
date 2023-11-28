import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:moniepointtest/homepage/views/homepagescreen.dart';
import 'package:moniepointtest/main.dart';
import 'package:moniepointtest/mywidgets/animatedButton.dart';
import 'package:moniepointtest/theme/palette.dart';

class CalculationDone extends StatefulWidget{

  static MaterialPageRoute<dynamic> route() => MaterialPageRoute(
    builder: (builder) => const CalculationDone(),
  );
  const CalculationDone({super.key});

  @override
  State<CalculationDone> createState() => _CalculationDoneState();
}
class _CalculationDoneState extends State<CalculationDone> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: NavBar(context, currentIndex: 0),

      backgroundColor: Palette.white,
      // appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
             Row(
               mainAxisSize: MainAxisSize.min,
               children: [
                 Text('MoveMate', style:TextStyle(color: Palette.tagPurple, fontSize: 35)),
                 Image.asset('assets/images/package.png',height: 45,)
               ],
             ),
            Image.asset('assets/images/package.png',height: 125,),
            Text('Total Estimated Amount', style:TextStyle(color: Palette.black)),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('\$', style:TextStyle(color: Palette.tagGreenbutton, fontSize: 22)),
                    Countup(
                      begin: 0,
                      end: 1460,
                      duration: Duration(seconds: 3),
                      separator: ',',
                      style: TextStyle(color: Palette.tagGreenbutton, fontSize: 22),
                    ),
                  Text('USD', style:TextStyle(color: Palette.tagGreenbutton, fontSize: 18)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal:20),
                  child: Text('The amount estimated with vary if you change location and weight',textAlign: TextAlign.center, style:TextStyle(color: Palette.black)),
                ),
                MyAnimatedButton(title: 'Back to home',action: (){
                  Navigator.push(context, HomePage.route());
                },),

              ]),
        ),
      ),
    );
  }
}
