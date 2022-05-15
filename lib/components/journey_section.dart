import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../utils/my_theme.dart';

class JourneySection extends StatefulWidget {
  const JourneySection({Key? key}) : super(key: key);

  @override
  State<JourneySection> createState() => _JourneySectionState();
}

class _JourneySectionState extends State<JourneySection>
    with TickerProviderStateMixin {
  late AnimationController _titleController;
  late AnimationController _pointOneController,
      _pointTwoController,
      _pointThreeController,
      _pointFourController;
  late Animation<double> _titleTranslation,
      _pointOneTranslation,
      _pointTwoTranslation,
      _pointThreeTranslation,
      _pointFourTranslation;

  @override
  void initState() {
    super.initState();
    _titleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _pointOneController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _pointTwoController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _pointThreeController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _pointFourController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    _titleTranslation = Tween(begin: 100.0, end: 0.0).animate(
        CurvedAnimation(parent: _titleController, curve: Curves.bounceInOut));

    _pointOneTranslation = Tween(begin: 100.0, end: 0.0).animate(
        CurvedAnimation(
            parent: _pointOneController, curve: Curves.bounceInOut));
    _pointTwoTranslation = Tween(begin: 100.0, end: 0.0).animate(
        CurvedAnimation(
            parent: _pointTwoController, curve: Curves.bounceInOut));
    _pointThreeTranslation = Tween(begin: 100.0, end: 0.0).animate(
        CurvedAnimation(
            parent: _pointThreeController, curve: Curves.bounceInOut));
    _pointFourTranslation = Tween(begin: 100.0, end: 0.0).animate(
        CurvedAnimation(
            parent: _pointFourController, curve: Curves.bounceInOut));

    _titleController.addListener(() {
      if (mounted) setState(() {});
    });
    _pointOneController.addListener(() {
      if (mounted) setState(() {});
    });
    _pointTwoController.addListener(() {
      if (mounted) setState(() {});
    });
    _pointThreeController.addListener(() {
      if (mounted) setState(() {});
    });
    _pointFourController.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _pointOneController.dispose();
    _pointTwoController.dispose();
    _pointThreeController.dispose();
    _pointFourController.dispose();

    super.dispose();
  }

  void forwardAnimation() {
    _titleController.forward();
    Timer(const Duration(milliseconds: 500), () {
      _pointOneController.forward();
      Timer(const Duration(milliseconds: 500), () {
        _pointTwoController.forward();
        Timer(const Duration(milliseconds: 500), () {
          _pointThreeController.forward();
          Timer(const Duration(milliseconds: 500), () {
            _pointFourController.forward();
          });
        });
      });
    });
  }

  void reverseAnimation() {
    _titleController.reverse();
    Timer(const Duration(milliseconds: 500), () {
      _pointOneController.reverse();
      Timer(const Duration(milliseconds: 500), () {
        _pointTwoController.reverse();
        Timer(const Duration(milliseconds: 500), () {
          _pointThreeController.reverse();
          Timer(const Duration(milliseconds: 500), () {
            _pointFourController.reverse();
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return VisibilityDetector(
      key: const Key("Journey Section"),
      onVisibilityChanged: (s) {
        if (s.visibleFraction > .4) {
          forwardAnimation();
        } else {
          reverseAnimation();
        }
      },
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        children: [
          LottieBuilder.network(
            "https://assets9.lottiefiles.com/packages/lf20_2gfeptkg.json",
            width: size.width * .3,
            height: size.width * .3,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: SizedBox(
              width: size.width * .5,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                        child: Text.rich(
                          TextSpan(text: "Journey", children: [
                            TextSpan(
                              text: "\nover destination",
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.bold,
                                  color: MyTheme.text,
                                  fontSize: 10),
                            )
                          ]),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                              color: MyTheme.text,
                              fontSize: 50),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView(shrinkWrap: true, children: [
                      AnimatedOpacity(
                        duration: _pointOneController.duration!,
                        opacity: _pointOneController.value,
                        child: TimelineTile(
                          alignment: TimelineAlign.start,
                          indicatorStyle: IndicatorStyle(
                              color: MyTheme.accent,
                              iconStyle:
                                  IconStyle(iconData: Icons.star_border_sharp)),
                          isFirst: true,
                          endChild: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: AnimatedContainer(
                              duration: _pointOneController.duration!,
                              transform: Matrix4.translationValues(
                                  _pointOneTranslation.value, 0, 0),
                              decoration: BoxDecoration(
                                color: MyTheme.accent,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.all(10),
                              child: const Text.rich(
                                TextSpan(
                                    text: "Born in April, 1999",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: MyTheme.text,
                                        fontSize: 16),
                                    children: [
                                      TextSpan(
                                          text:
                                              "\nPunjab, India\nBrought up in New Delhi, India.",
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: MyTheme.text,
                                              fontSize: 16)),
                                    ]),
                              ),
                            ),
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                        duration: _pointTwoController.duration!,
                        opacity: _pointTwoController.value,
                        child: TimelineTile(
                          alignment: TimelineAlign.start,
                          indicatorStyle: IndicatorStyle(
                              color: MyTheme.accent,
                              iconStyle:
                                  IconStyle(iconData: Icons.star_border_sharp)),
                          endChild: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: AnimatedContainer(
                              duration: _pointTwoController.duration!,
                              transform: Matrix4.translationValues(
                                  _pointTwoTranslation.value, 0, 0),
                              decoration: BoxDecoration(
                                color: MyTheme.accent,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.all(10),
                              child: const Text.rich(
                                TextSpan(
                                    text: "High School",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: MyTheme.text,
                                        fontSize: 16),
                                    children: [
                                      TextSpan(
                                          text:
                                              "\nSri Guru Nanak Public School, New Delhi, India\n Year of passing - 2017",
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: MyTheme.text,
                                              fontSize: 16)),
                                    ]),
                              ),
                            ),
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                        duration: _pointThreeController.duration!,
                        opacity: _pointThreeController.value,
                        child: TimelineTile(
                          alignment: TimelineAlign.start,
                          indicatorStyle: IndicatorStyle(
                              color: MyTheme.accent,
                              iconStyle:
                                  IconStyle(iconData: Icons.star_border_sharp)),
                          endChild: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: AnimatedContainer(
                              duration: _pointThreeController.duration!,
                              transform: Matrix4.translationValues(
                                  _pointThreeTranslation.value, 0, 0),
                              decoration: BoxDecoration(
                                color: MyTheme.accent,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.all(10),
                              child: const Text.rich(
                                TextSpan(
                                    text: "Graduation",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: MyTheme.text,
                                        fontSize: 16),
                                    children: [
                                      TextSpan(
                                          text:
                                              "\nGuru Gobind Singh Indraprastha University, New Delhi, India\nYear of passing - 2021",
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: MyTheme.text,
                                              fontSize: 16)),
                                    ]),
                              ),
                            ),
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                        duration: _pointFourController.duration!,
                        opacity: _pointFourController.value,
                        child: TimelineTile(
                          alignment: TimelineAlign.start,
                          indicatorStyle: IndicatorStyle(
                              color: MyTheme.accent,
                              iconStyle:
                                  IconStyle(iconData: Icons.star_border_sharp)),
                          isLast: true,
                          endChild: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: AnimatedContainer(
                              duration: _pointFourController.duration!,
                              transform: Matrix4.translationValues(
                                  _pointFourTranslation.value, 0, 0),
                              decoration: BoxDecoration(
                                color: MyTheme.accent,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.all(10),
                              child: const Text.rich(
                                TextSpan(
                                    text: "Associate Software Engineer",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: MyTheme.text,
                                        fontSize: 16),
                                    children: [
                                      TextSpan(
                                          text:
                                              "\nBetaflux Pvt. Ltd., Bangalore, India\n2021 - Present",
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: MyTheme.text,
                                              fontSize: 16)),
                                    ]),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
