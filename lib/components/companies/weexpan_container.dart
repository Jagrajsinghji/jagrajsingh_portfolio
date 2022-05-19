import 'package:flutter/material.dart';

import '../../utils/my_theme.dart';

class WeExpanContainer extends StatefulWidget {
  const WeExpanContainer({Key? key}) : super(key: key);

  @override
  State<WeExpanContainer> createState() => _WeExpanContainerState();
}

class _WeExpanContainerState extends State<WeExpanContainer>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _titleTranslation;
  late Animation<double> _contentOpacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _titleTranslation = Tween(begin: Alignment.center, end: Alignment.topCenter)
        .animate(
            CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));
    _contentOpacity = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));
    _controller.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: MouseRegion(
        onEnter: (d) {
          if (mounted) _controller.forward();
        },
        onExit: (d) {
          if (mounted) _controller.reverse();
        },
        child: Container(
            width: 300,
            height: 350,
            decoration: BoxDecoration(
                color: MyTheme.white, borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(14),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    transform: Transform.translate(
                            offset:
                                Offset(0, -50 + (50 * _contentOpacity.value)))
                        .transform,
                    child: AnimatedOpacity(
                      opacity: _contentOpacity.value,
                      duration: const Duration(milliseconds: 300),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              "WeExpan",
                              style: TextStyle(
                                  color: Color(0xff1e366e),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                "I received a job offer from WeExpan during my graduation year, in November 2020.",
                                style: TextStyle(
                                    color: MyTheme.text,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                "I was appointed on Wowfas, an E-Commerce platform that we built from the ground up.",
                                style: TextStyle(
                                    color: MyTheme.text,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                "It is a comprehensive online shopping business with a massive product assortment.",
                                style: TextStyle(
                                    color: MyTheme.text,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  alignment: _titleTranslation.value,
                  child: Image.asset(
                    "assets/weExpan_logo.jpeg",
                    height: 120 - (60 * _controller.value),
                    width: 120 - (60 * _controller.value),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
