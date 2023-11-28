import 'package:flutter/material.dart';
import 'package:moniepointtest/calculate/views/calculation_done_screen.dart';
import 'package:moniepointtest/theme/palette.dart';

class MyAnimatedButton extends StatefulWidget {
  final String? title;
  final Function action;
  MyAnimatedButton({Key? key, this.title, required this.action});
  @override
  _MyAnimatedButtonState createState() => _MyAnimatedButtonState();
}

class _MyAnimatedButtonState extends State<MyAnimatedButton> {
   double? _buttonSize;
   // double bigSize = 180;
   // double smallSize= 120;

  @override
  void initState() {
    // TODO: implement initState



      super.initState();
  }

   void _animateButton() {
     double bigSize = MediaQuery.of(context).size.width*0.8;
     double smallSize = MediaQuery.of(context).size.width*0.6;
     // double _buttonSize = smallSize;
     setState(() {

       _buttonSize = (_buttonSize != bigSize) ? bigSize : smallSize;
     });
   }
  @override
  Widget build(BuildContext context) {


    return GestureDetector(
      onTap: () {
        Future.delayed(Duration(milliseconds: 200),(){
          _animateButton();
        });
        Future.delayed(Duration(milliseconds: 500),(){
          _animateButton();
        });
        Future.delayed(Duration(milliseconds: 750),(){
         widget.action();
        });
      },
      child: AnimatedContainer(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          color: Palette.tagOrange,
        ),
        duration: Duration(milliseconds: 300),
        width: _buttonSize?? MediaQuery.of(context).size.width*0.8,
        height: 40.0,

        child: Center(
          child: Text(
            widget.title??'',
            style: TextStyle(color: Colors.white,fontSize: 16),
          ),
        ),
      ),
    );
  }


}