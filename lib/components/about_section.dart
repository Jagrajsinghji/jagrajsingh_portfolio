import 'dart:async';
import 'dart:ui';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../main.dart';
import '../utils/my_theme.dart';
import '../utils/painters/dots_painter.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection>
    with TickerProviderStateMixin {
  late AnimationController _titleController;
  late AnimationController _subTitleController;
  late Animation<double> _titleTranslation, _subTitleTranslation;
  String myAge = (DateTime.now().difference(DateTime(1999, 4, 16)).inDays / 365)
      .floor()
      .toString();

  @override
  void initState() {
    super.initState();
    _titleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _subTitleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    _titleTranslation = Tween(begin: -100.0, end: 0.0).animate(
        CurvedAnimation(parent: _titleController, curve: Curves.bounceInOut));

    _subTitleTranslation = Tween(begin: -100.0, end: 0.0).animate(
        CurvedAnimation(
            parent: _subTitleController, curve: Curves.bounceInOut));

    _titleController.addListener(() {
      if (mounted) setState(() {});
    });
    _subTitleController.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _subTitleController.dispose();
    super.dispose();
  }

  void forwardAnimation() {
    if (!mounted) return;
    _titleController.forward();
    Timer(const Duration(milliseconds: 300), () {
      _subTitleController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isMobile = size.width <= 620;
    bool showSpotlightImage = browserName == BrowserName.safari ||
        defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS;
    return VisibilityDetector(
      key: const Key("About Section"),
      onVisibilityChanged: (s) {
        if (s.visibleFraction > .3) {
          forwardAnimation();
        }
      },
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          MyTheme.whatStandButton.withOpacity(.2),
          Colors.grey.shade100,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: ClipRRect(
          borderRadius: BorderRadius.zero,
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.center,
            direction: Axis.horizontal,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: size.width * (isMobile ? .8 : 0.4),
                  child: CustomPaint(
                    painter: DotsPainter(),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedOpacity(
                              duration: _titleController.duration!,
                              opacity: _titleController.value,
                              child: AnimatedContainer(
                                transform: Matrix4.translationValues(
                                    _titleTranslation.value, 0, 0),
                                duration: _titleController.duration!,
                                child: const Text(
                                  "About",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyTheme.maroon,
                                      fontSize: 50),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            AnimatedOpacity(
                              duration: _subTitleController.duration!,
                              opacity: _subTitleController.value,
                              child: AnimatedContainer(
                                transform: Matrix4.translationValues(
                                    _subTitleTranslation.value, 0, 0),
                                duration: _subTitleController.duration!,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "I'm Jagraj Singh, a philosopher having $myAge years of experience in life.",
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          height: 1.5,
                                          color: MyTheme.redDark,
                                          fontSize: 16),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5.0),
                                      child: Text(
                                        "I create an impact with my algorithms and poetry.",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            height: 1.5,
                                            color: MyTheme.redDark,
                                            fontSize: 16),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5.0),
                                      child: Text(
                                        "I design and create software with the broader picture in mind, I believe that's the crux.",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            height: 1.5,
                                            color: MyTheme.redDark,
                                            fontSize: 16),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5.0),
                                      child: Text(
                                        "Although I am passionate about programming, I also have a soft spot for IoT (Internet of Things) and 3D printing.",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            height: 1.5,
                                            color: MyTheme.redDark,
                                            fontSize: 16),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 10.0),
                                      child: Text(
                                        "Let's take a tour through my educational and professional engagements.",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            height: 1.5,
                                            color: MyTheme.redDark,
                                            fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
              if (showSpotlightImage && !isMobile)
                Image.asset(
                  "assets/spotlight.png",
                  width: size.width * .4,
                  height: size.width * .4,
                )
              else if (!isMobile)
                LottieBuilder.asset(
                  "assets/what_stand_me_out.json",
                  width: size.width * .4,
                  height: size.width * .4,
                )
            ],
          ),
        ),
      ),
    );
  }
}
