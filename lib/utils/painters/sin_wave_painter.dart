import 'package:flutter/material.dart';
import 'package:jagrajsingh_portfolio/utils/my_theme.dart';

class SinWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = MyTheme.greenBushWithOpacity
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8.0;
    Paint paint2 = Paint()
      ..color = MyTheme.greenDark
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8.0;

    Path path1 = Path()
      ..moveTo(size.width * .35, -60)
      ..quadraticBezierTo(
          size.width, size.height * .125, size.width * .5, size.height * .25)
      ..quadraticBezierTo(0, .375 * size.height, size.width, size.height * .7);

    Path path2 = Path()
      ..moveTo(size.width * .1, -70)
      ..quadraticBezierTo(size.width - 200, size.height * .125,
          (size.width * .5) - 200, size.height * .22)
      ..quadraticBezierTo(-100, size.height * .3, size.width, size.height);

    canvas.drawPath(path1, paint);
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(SinWavePainter oldDelegate) => false;
}
