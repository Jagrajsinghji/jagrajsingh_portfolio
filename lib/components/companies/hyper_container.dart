import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jagrajsingh_portfolio/utils/my_urls.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/my_theme.dart';

class HyperContainer extends StatefulWidget {
  const HyperContainer({Key? key}) : super(key: key);

  @override
  State<HyperContainer> createState() => _HyperContainerState();
}

class _HyperContainerState extends State<HyperContainer>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _titleTranslation;
  late Animation<double> _contentOpacity;

  bool isTapped = false;

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
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: () {
            isTapped = !isTapped;
            if (isTapped) if (mounted) _controller.forward();
            if (!isTapped) if (mounted) _controller.reverse();
          },
          child: MouseRegion(
            onEnter: (d) {
              if (mounted) _controller.forward();
            },
            onExit: (d) {
              if (mounted) _controller.reverse();
            },
            child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: MyTheme.greenBushWithOpacity,
                          blurRadius: 3,
                          spreadRadius: 2,
                          offset: const Offset(2, 2))
                    ],
                    color: MyTheme.white,
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(14),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        transform: Transform.translate(
                                offset: Offset(
                                    0, -50 + (50 * _contentOpacity.value)))
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
                                  "Hyper",
                                  style: TextStyle(
                                      color: MyTheme.hyperRed,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    "You never forget your first organisation, just as you never forget your first ♥️",
                                    style: TextStyle(
                                      color: MyTheme.text,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    "In August 2018, I entered Hyper during my second year of graduation.",
                                    style: TextStyle(
                                      color: MyTheme.text,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    "I began as a Application Developer, but the irresistible pull of curiosity drew me in, and I was given the opportunity to design groundbreaking IoT solutions.",
                                    style: TextStyle(
                                      color: MyTheme.text,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      alignment: _titleTranslation.value,
                      child: SvgPicture.asset(
                        "assets/hyper_logo.svg",
                        height: 90 - (55 * _controller.value),
                        width: 90 - (55 * _controller.value),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(Icons.open_in_new),
                        onPressed: () async {
                          if (await canLaunchUrl(MyURLs.hyperWebsite)) {
                            launchUrl(MyURLs.hyperWebsite);
                          }
                        },
                      ),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
