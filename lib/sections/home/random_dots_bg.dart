import 'package:flutter/material.dart';
import 'package:jagrajsingh_portfolio/utils/painters/dots_painter.dart';

class RandomDotsBg extends StatefulWidget {
  const RandomDotsBg({super.key});

  @override
  State<RandomDotsBg> createState() => _RandomDotsBgState();
}

class _RandomDotsBgState extends State<RandomDotsBg>
    with SingleTickerProviderStateMixin {
  late AnimationController _ballsController;

  double containerWidth = 1200;
  double containerHeight = 500;
  final List<MovingCircle> circles = [];

  void generateRandomCircles() {
    for (int i = 0; i < 7; i++) {
      circles.add(MovingCircle(containerWidth, containerHeight));
    }
  }

  @override
  void initState() {
    _ballsController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..repeat();
    _ballsController.addListener(() {
      if (mounted) setState(() {});
    });
    generateRandomCircles();
    super.initState();
  }

  @override
  void dispose() {
    _ballsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RandomCirclesPainter(circles, _ballsController),
      size: Size(containerWidth, containerHeight), // Full section size
    );
  }
}
