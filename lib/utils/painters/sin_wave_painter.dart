import 'package:flutter/material.dart';

class SinWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double curveStartingYPoint = 100;
    if (size.width < 1200) {
      curveStartingYPoint = -60 * ((size.width - 620) / 1200);
      if (curveStartingYPoint.isNegative) curveStartingYPoint = 0;
    }
    Paint paint = Paint()
      ..color = Color(0xFFFFFDD0)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 2)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8.0;
    Paint paint2 = Paint()
      ..color = Color(0xFFFFFDD0)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 2)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8.0;

    Path path1 = Path()
      ..moveTo(size.width * .6, curveStartingYPoint)
      ..quadraticBezierTo(
          size.width, size.height * .125, size.width * .5, size.height * .25)
      ..quadraticBezierTo(0, .375 * size.height, size.width, size.height * .7);

    Path path2 = Path()
      ..moveTo(size.width * .2, curveStartingYPoint)
      ..quadraticBezierTo(size.width - 200, size.height * .125,
          (size.width * .5) - 200, size.height * .22)
      ..quadraticBezierTo(-100, size.height * .3, size.width, size.height);

    canvas.drawPath(path1, paint);
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(SinWavePainter oldDelegate) => false;
}
