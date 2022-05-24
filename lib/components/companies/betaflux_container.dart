import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/my_theme.dart';
import '../../utils/my_urls.dart';

class BetafluxContainer extends StatefulWidget {
  const BetafluxContainer({Key? key}) : super(key: key);

  @override
  State<BetafluxContainer> createState() => _BetafluxContainerState();
}

class _BetafluxContainerState extends State<BetafluxContainer>
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
            height: 300,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: MyTheme.greenBushWithOpacity,
                  blurRadius: 3,
                  spreadRadius: 2,
                  offset: const Offset(2, 2))
            ], color: MyTheme.white, borderRadius: BorderRadius.circular(10)),
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
                              "Betaflux Pvt. Ltd.",
                              style: TextStyle(
                                  color: MyTheme.btflxBlue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                "I am presently employed as an Associate Software Engineer, at Betaflux.",
                                style: TextStyle(
                                  color: MyTheme.text,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                "I am involved with backend services in Java and mobile apps in Flutter.",
                                style: TextStyle(
                                  color: MyTheme.text,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                "Quoting Animesh (CEO) - \n \"You're putting out tremendously impacting products at Betaflux for clients across South East Asia, India, and Europe!\"",
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
                  child: Image.asset(
                    "assets/betaflux_logo.jpeg",
                    height: 120 - (60 * _controller.value),
                    width: 120 - (60 * _controller.value),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.open_in_new),
                    onPressed: () async {
                      if (await canLaunchUrl(MyURLs.betafluxWebsite)) {
                        launchUrl(MyURLs.betafluxWebsite);
                      }
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }
}
