import 'dart:math';

import 'package:flutter/material.dart';

class MovingCircle {
  double x = 0;
  double y = 0;
  double speedX = 0;
  double speedY = 0;
  double radius = 0;
  Color color;

  MovingCircle(double containerWidth, double containerHeight)
      : x = Random().nextDouble() * containerWidth,
        // Random x position within container width
        y = Random().nextDouble() * containerHeight,
        // Random initial y position
        speedX = (Random().nextDouble() * 2) - 1,
        // Speed between -1 and 1
        speedY = (Random().nextDouble() * 2) - 1,
        // Speed between -1 and 1
        radius = Random().nextDouble() * 35 + 10,
        // Random size
        color = Colors.primaries[
            Random().nextInt(Colors.primaries.length)]; // Random color

  void updatePosition(Size size) {
    x += speedX * 4; // Move x
    y += speedY * 4; // Move y

    // Bounce off walls
    if (x < 0 || x > size.width) speedX *= -1;
    if (y < 0 || y > size.height) speedY *= -1;
  }
}

class RandomCirclesPainter extends CustomPainter {
  final List<MovingCircle> circles;
  final AnimationController controller;

  RandomCirclesPainter(this.circles, this.controller);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 2);

    for (var circle in circles) {
      circle.updatePosition(size);

      paint.color = circle.color.withValues(alpha: 0.8); // Add transparency
      canvas.drawCircle(Offset(circle.x, circle.y), circle.radius, paint);
    }
  }

  @override
  bool shouldRepaint(RandomCirclesPainter oldDelegate) => true;
}
