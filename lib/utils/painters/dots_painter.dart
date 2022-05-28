import 'package:flutter/material.dart';

import '../my_theme.dart';

class DotsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(size.width * .3, size.height * .1), 50,
        Paint()..color = MyTheme.maroon.withOpacity(.4));
    canvas.drawCircle(
        Offset(size.width * .9, -20), 40, Paint()..color = MyTheme.pinkDark);

    canvas.drawCircle(Offset(size.width * .8, size.height * .7), 30,
        Paint()..color = MyTheme.brown.withOpacity(.5));

    canvas.drawCircle(Offset(size.width * .4, size.height), 40,
        Paint()..color = MyTheme.darkYellow.withOpacity(.3));

    canvas.drawCircle(Offset(0, size.height * .5), 20,
        Paint()..color = MyTheme.skyBlue);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
