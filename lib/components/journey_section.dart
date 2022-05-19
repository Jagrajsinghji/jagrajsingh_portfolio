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
        vsync: this, duration: const Duration(milliseconds: 300));
    _pointOneController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _pointTwoController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _pointThreeController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _pointFourController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

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
    if (!mounted) return;
    _titleController.forward();
    Timer(const Duration(milliseconds: 100), () {
      _pointOneController.forward();
      Timer(const Duration(milliseconds: 100), () {
        _pointTwoController.forward();
        Timer(const Duration(milliseconds: 100), () {
          _pointThreeController.forward();
          Timer(const Duration(milliseconds: 100), () {
            _pointFourController.forward();
          });
        });
      });
    });
  }

  bool point1Hover = false,
      point2Hover = false,
      point3Hover = false,
      point4Hover = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return VisibilityDetector(
      key: const Key("Journey Section"),
      onVisibilityChanged: (s) {
        if (s.visibleFraction > .2) {
          forwardAnimation();
        }
      },
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: LottieBuilder.network(
              "https://assets9.lottiefiles.com/packages/lf20_2gfeptkg.json",
              width: size.width * .3,
              height: size.width * .3,
            ),
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
                          const TextSpan(text: "Journey", children: [
                            TextSpan(
                              text: "\nover destination",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: MyTheme.text,
                                  fontSize: 12),
                            )
                          ]),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                              color: MyTheme.brownTrunk,
                              fontSize: 50),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          AnimatedOpacity(
                            duration: _pointOneController.duration!,
                            opacity: _pointOneController.value,
                            child: TimelineTile(
                              alignment: TimelineAlign.start,
                              beforeLineStyle: const LineStyle(
                                color: MyTheme.brownTrunk,
                              ),
                              indicatorStyle: IndicatorStyle(
                                  color: MyTheme.greenBush,
                                  iconStyle: IconStyle(
                                      iconData: Icons.star_border_sharp,
                                      color: MyTheme.brownTrunk)),
                              isFirst: true,
                              endChild: MouseRegion(
                                onEnter: (p) {
                                  if (mounted) {
                                    setState(() {
                                      point1Hover = true;
                                    });
                                  }
                                },
                                onExit: (p) {
                                  if (mounted) {
                                    setState(() {
                                      point1Hover = false;
                                    });
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: AnimatedContainer(
                                    duration: _pointOneController.duration!,
                                    transform: Matrix4.translationValues(
                                        _pointOneTranslation.value, 0, 0),
                                    decoration: BoxDecoration(
                                      color: MyTheme.greenBush,
                                      boxShadow: [
                                        if (point1Hover)
                                          MyTheme.journeyBoxShadow,
                                      ],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.all(10),
                                    child: const Text.rich(
                                      TextSpan(
                                          text: "Born in April, 1999",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: MyTheme.brownTrunk,
                                              fontSize: 16),
                                          children: [
                                            TextSpan(
                                                text:
                                                    "\n Punjab, India\n Brought up in New Delhi, India.",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: MyTheme.text,
                                                    fontSize: 12)),
                                          ]),
                                    ),
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
                              beforeLineStyle: const LineStyle(
                                color: MyTheme.brownTrunk,
                              ),
                              indicatorStyle: IndicatorStyle(
                                  color: MyTheme.greenBush,
                                  iconStyle: IconStyle(
                                      iconData: Icons.star_border_sharp,
                                      color: MyTheme.brownTrunk)),
                              endChild: MouseRegion(
                                onEnter: (p) {
                                  if (mounted) {
                                    setState(() {
                                      point2Hover = true;
                                    });
                                  }
                                },
                                onExit: (p) {
                                  if (mounted) {
                                    setState(() {
                                      point2Hover = false;
                                    });
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: AnimatedContainer(
                                    duration: _pointTwoController.duration!,
                                    transform: Matrix4.translationValues(
                                        _pointTwoTranslation.value, 0, 0),
                                    decoration: BoxDecoration(
                                      color: MyTheme.greenBush,
                                      boxShadow: [
                                        if (point2Hover)
                                          MyTheme.journeyBoxShadow,
                                      ],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.all(10),
                                    child: const Text.rich(
                                      TextSpan(
                                          text: "High School",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: MyTheme.brownTrunk,
                                              fontSize: 16),
                                          children: [
                                            TextSpan(
                                                text:
                                                    "\n Sri Guru Nanak Public School, New Delhi, India\n Year of passing - 2017",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: MyTheme.text,
                                                    fontSize: 12)),
                                          ]),
                                    ),
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
                              beforeLineStyle: const LineStyle(
                                color: MyTheme.brownTrunk,
                              ),
                              indicatorStyle: IndicatorStyle(
                                  color: MyTheme.greenBush,
                                  iconStyle: IconStyle(
                                      iconData: Icons.star_border_sharp,
                                      color: MyTheme.brownTrunk)),
                              endChild: MouseRegion(
                                onEnter: (p) {
                                  if (mounted) {
                                    setState(() {
                                      point3Hover = true;
                                    });
                                  }
                                },
                                onExit: (p) {
                                  if (mounted) {
                                    setState(() {
                                      point3Hover = false;
                                    });
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: AnimatedContainer(
                                    duration: _pointThreeController.duration!,
                                    transform: Matrix4.translationValues(
                                        _pointThreeTranslation.value, 0, 0),
                                    decoration: BoxDecoration(
                                      color: MyTheme.greenBush,
                                      boxShadow: [
                                        if (point3Hover)
                                          MyTheme.journeyBoxShadow,
                                      ],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text.rich(
                                          TextSpan(
                                              text:
                                                  "Computer Science Engineering",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: MyTheme.brownTrunk,
                                                  fontSize: 16),
                                              children: [
                                                TextSpan(
                                                    text:
                                                        "\n Guru Gobind Singh Indraprastha University, New Delhi, India\n 2017 - 2021",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: MyTheme.text,
                                                        fontSize: 12)),
                                              ]),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: SizedBox(
                                            height: 70,
                                            child: TimelineTile(
                                              alignment: TimelineAlign.start,
                                              isFirst: true,
                                              afterLineStyle: LineStyle(
                                                  color: MyTheme.greenDark),
                                              indicatorStyle: IndicatorStyle(
                                                  color: MyTheme.brownTrunk,
                                                  iconStyle: IconStyle(
                                                      iconData: Icons
                                                          .star_border_sharp,
                                                      color: MyTheme.white)),
                                              endChild: const Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: Text.rich(
                                                  TextSpan(
                                                      text:
                                                          "Flutter Developer, Hyper",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: MyTheme
                                                              .brownTrunk,
                                                          fontSize: 16),
                                                      children: [
                                                        TextSpan(
                                                            text:
                                                                "\n Aug 2018 - May 2020",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color: MyTheme
                                                                    .text,
                                                                fontSize: 12)),
                                                      ]),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: SizedBox(
                                            height: 90,
                                            child: TimelineTile(
                                              alignment: TimelineAlign.start,
                                              afterLineStyle: LineStyle(
                                                  color: MyTheme.greenDark),
                                              beforeLineStyle: LineStyle(
                                                  color: MyTheme.greenDark),
                                              indicatorStyle: IndicatorStyle(
                                                  color: MyTheme.brownTrunk,
                                                  iconStyle: IconStyle(
                                                      iconData: Icons
                                                          .star_border_sharp,
                                                      color: MyTheme.white)),
                                              endChild: const Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: Text.rich(
                                                  TextSpan(
                                                      text:
                                                          "Flutter Developer, Specso Technologies",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: MyTheme
                                                              .brownTrunk,
                                                          fontSize: 16),
                                                      children: [
                                                        TextSpan(
                                                            text:
                                                                "\n July 2020 - Aug 2021",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color: MyTheme
                                                                    .text,
                                                                fontSize: 12)),
                                                      ]),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: SizedBox(
                                            height: 70,
                                            child: TimelineTile(
                                              alignment: TimelineAlign.start,
                                              isLast: true,
                                              beforeLineStyle: LineStyle(
                                                  color: MyTheme.greenDark),
                                              indicatorStyle: IndicatorStyle(
                                                  color: MyTheme.brownTrunk,
                                                  iconStyle: IconStyle(
                                                      iconData: Icons
                                                          .star_border_sharp,
                                                      color: MyTheme.white)),
                                              endChild: const Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: Text.rich(
                                                  TextSpan(
                                                      text:
                                                          "Flutter Developer, WeExpan Pvt. Ltd.",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: MyTheme
                                                              .brownTrunk,
                                                          fontSize: 16),
                                                      children: [
                                                        TextSpan(
                                                            text:
                                                                "\n Nov 2020 - Jan 2021",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color: MyTheme
                                                                    .text,
                                                                fontSize: 12)),
                                                      ]),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
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
                              beforeLineStyle: const LineStyle(
                                color: MyTheme.brownTrunk,
                              ),
                              indicatorStyle: IndicatorStyle(
                                  color: MyTheme.greenBush,
                                  iconStyle: IconStyle(
                                      iconData: Icons.star_border_sharp,
                                      color: MyTheme.brownTrunk)),
                              isLast: true,
                              endChild: MouseRegion(
                                onEnter: (p) {
                                  if (mounted) {
                                    setState(() {
                                      point4Hover = true;
                                    });
                                  }
                                },
                                onExit: (p) {
                                  if (mounted) {
                                    setState(() {
                                      point4Hover = false;
                                    });
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: AnimatedContainer(
                                    duration: _pointFourController.duration!,
                                    transform: Matrix4.translationValues(
                                        _pointFourTranslation.value, 0, 0),
                                    decoration: BoxDecoration(
                                      color: MyTheme.greenBush,
                                      boxShadow: [
                                        if (point4Hover)
                                          MyTheme.journeyBoxShadow,
                                      ],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.all(10),
                                    child: const Text.rich(
                                      TextSpan(
                                          text: "Associate Software Engineer",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: MyTheme.brownTrunk,
                                              fontSize: 16),
                                          children: [
                                            TextSpan(
                                                text:
                                                    "\n Betaflux Pvt. Ltd., Bangalore, India\n 2021 - Present",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: MyTheme.text,
                                                    fontSize: 12)),
                                          ]),
                                    ),
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
