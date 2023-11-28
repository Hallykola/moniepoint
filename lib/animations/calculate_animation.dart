import 'package:flutter/material.dart';

class CalculateAnimator {
  AnimationController controller;
  Animation<double> chipsMovementX;
  Animation<double> inputMovementY;
  Animation<double> thirdCardMovementY;

  CalculateAnimator(AnimationController controller, double height,double width)
      : this.controller = controller,
        chipsMovementX = Tween(begin: width, end: 0.0).animate(
            CurvedAnimation(
                parent: controller,
                curve: Interval(0.1, 0.4, curve: Curves.easeIn))),
        inputMovementY = Tween(begin: 2*height , end: 0.0).animate(
            CurvedAnimation(
                parent: controller,
                curve: Interval(0.3, 0.5, curve: Curves.easeIn))),
        thirdCardMovementY = Tween(begin: 2*height, end: 0.0).animate(
            CurvedAnimation(
                parent: controller,
                curve: Interval(0.4, 0.6, curve: Curves.easeIn)));
}