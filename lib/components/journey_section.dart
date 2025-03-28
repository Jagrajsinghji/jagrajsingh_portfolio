import 'dart:async';
import 'dart:ui';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jagrajsingh_portfolio/main.dart';
import 'package:jagrajsingh_portfolio/utils/my_urls.dart';
import 'package:jagrajsingh_portfolio/utils/painters/sin_wave_painter.dart';
import 'package:lottie/lottie.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:url_launcher/url_launcher.dart';
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
      _pointFourController,
      _pointFiveController;
  late Animation<double> _titleTranslation,
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
    _pointFiveController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    _titleTranslation = Tween(begin: 100.0, end: 0.0).animate(
        CurvedAnimation(parent: _titleController, curve: Curves.bounceInOut));

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
    _pointFiveController.addListener(() {
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
    _pointFiveController.dispose();

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
            Timer(const Duration(milliseconds: 100), () {
              _pointFiveController.forward();
            });
          });
        });
      });
    });
  }

  bool point1Hover = false,
      point2Hover = false,
      point3Hover = false,
      point4Hover = false,
      point5Hover = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isMobile = size.width <= 620;
    bool showLottie = browserName != BrowserName.safari &&
        defaultTargetPlatform != TargetPlatform.android &&
        defaultTargetPlatform != TargetPlatform.iOS;

    return VisibilityDetector(
      key: const Key("Journey Section"),
      onVisibilityChanged: (s) {
        if (s.visibleFraction > .2) {
          forwardAnimation();
        }
      }, //2030
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.grey.shade100, MyTheme.greenBush.withOpacity(.1)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: CustomPaint(
          painter: SinWavePainter(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              children: [
                if (showLottie && (!isMobile))
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: LottieBuilder.asset(
                      "assets/journey.json",
                      errorBuilder: (_, __, ___) => Container(),
                      width: size.width * .3,
                      height: size.width * .3,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: SizedBox(
                    width: size.width * (isMobile ? 1 : .5),
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
                                // AnimatedOpacity(
                                //   duration: _pointOneController.duration!,
                                //   opacity: _pointOneController.value,
                                //   child: TimelineTile(
                                //     alignment: TimelineAlign.start,
                                //     beforeLineStyle: const LineStyle(
                                //       color: MyTheme.brownTrunk,
                                //     ),
                                //     indicatorStyle: IndicatorStyle(
                                //         color: MyTheme.greenBush,
                                //         iconStyle: IconStyle(
                                //             iconData: Icons.star_border_sharp,
                                //             color: MyTheme.brownTrunk)),
                                //     isFirst: true,
                                //     endChild: MouseRegion(
                                //       onEnter: (p) {
                                //         if (mounted) {
                                //           setState(() {
                                //             point1Hover = true;
                                //           });
                                //         }
                                //       },
                                //       onExit: (p) {
                                //         if (mounted) {
                                //           setState(() {
                                //             point1Hover = false;
                                //           });
                                //         }
                                //       },
                                //       child: Padding(
                                //         padding: const EdgeInsets.all(10.0),
                                //         child: ClipRRect(
                                //           borderRadius:
                                //               BorderRadius.circular(10.0),
                                //           child: AnimatedContainer(
                                //             duration:
                                //                 _pointOneController.duration!,
                                //             transform:
                                //                 Matrix4.translationValues(
                                //                     _pointOneTranslation.value,
                                //                     0,
                                //                     0),
                                //             decoration: BoxDecoration(
                                //               color: point1Hover
                                //                   ? MyTheme.greenBush
                                //                   : MyTheme
                                //                       .greenBushWithOpacity,
                                //               borderRadius:
                                //                   BorderRadius.circular(10.0),
                                //             ),
                                //             alignment: Alignment.centerLeft,
                                //             padding: const EdgeInsets.all(10),
                                //             child: BackdropFilter(
                                //               filter: ImageFilter.blur(
                                //                   sigmaX: 5, sigmaY: 5),
                                //               child: const Text.rich(
                                //                 TextSpan(
                                //                     text: "Born in April, 1999",
                                //                     style: TextStyle(
                                //                         fontWeight:
                                //                             FontWeight.bold,
                                //                         color:
                                //                             MyTheme.brownTrunk,
                                //                         fontSize: 16),
                                //                     children: [
                                //                       TextSpan(
                                //                           text:
                                //                               "\n Punjab, India\n Brought up in New Delhi, India.",
                                //                           style: TextStyle(
                                //                               fontWeight:
                                //                                   FontWeight
                                //                                       .normal,
                                //                               color:
                                //                                   MyTheme.text,
                                //                               fontSize: 12)),
                                //                     ]),
                                //               ),
                                //             ),
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                AnimatedOpacity(
                                  duration: _pointTwoController.duration!,
                                  opacity: _pointTwoController.value,
                                  child: TimelineTile(
                                    alignment: TimelineAlign.start,
                                    beforeLineStyle: const LineStyle(
                                      color: MyTheme.brownTrunk,
                                    ),
                                    isFirst: true,
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
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: AnimatedContainer(
                                            duration:
                                                _pointTwoController.duration!,
                                            transform:
                                                Matrix4.translationValues(
                                                    _pointTwoTranslation.value,
                                                    0,
                                                    0),
                                            decoration: BoxDecoration(
                                              color: point2Hover
                                                  ? MyTheme.greenBush
                                                  : MyTheme
                                                      .greenBushWithOpacity,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            alignment: Alignment.centerLeft,
                                            padding: const EdgeInsets.all(10),
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                  sigmaY: 5, sigmaX: 5),
                                              child: const Text.rich(
                                                TextSpan(
                                                    text: "High School",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            MyTheme.brownTrunk,
                                                        fontSize: 16),
                                                    children: [
                                                      TextSpan(
                                                          text:
                                                              "\n Sri Guru Nanak Public School, New Delhi, India\n Year of passing - 2017",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color:
                                                                  MyTheme.text,
                                                              fontSize: 12)),
                                                    ]),
                                              ),
                                            ),
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
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: AnimatedContainer(
                                            duration:
                                                _pointThreeController.duration!,
                                            transform:
                                                Matrix4.translationValues(
                                                    _pointThreeTranslation
                                                        .value,
                                                    0,
                                                    0),
                                            decoration: BoxDecoration(
                                              color: point3Hover
                                                  ? MyTheme.greenBush
                                                  : MyTheme
                                                      .greenBushWithOpacity,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            alignment: Alignment.centerLeft,
                                            padding: const EdgeInsets.all(10),
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                  sigmaX: 5, sigmaY: 5),
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
                                                            "Bachelors of Technology, Computer Science Engineering",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: MyTheme
                                                                .brownTrunk,
                                                            fontSize: 16),
                                                        children: [
                                                          TextSpan(
                                                              text:
                                                                  "\n Guru Gobind Singh Indraprastha University, New Delhi, India\n Aug 2017 - Jul 2021",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color: MyTheme
                                                                      .text,
                                                                  fontSize:
                                                                      12)),
                                                        ]),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10.0),
                                                    child: SizedBox(
                                                      height: 70,
                                                      child: TimelineTile(
                                                        alignment:
                                                            TimelineAlign.start,
                                                        isFirst: true,
                                                        afterLineStyle:
                                                            LineStyle(
                                                                color: MyTheme
                                                                    .greenDark),
                                                        indicatorStyle: IndicatorStyle(
                                                            color: MyTheme
                                                                .brownTrunk,
                                                            iconStyle: IconStyle(
                                                                iconData: Icons
                                                                    .star_border_sharp,
                                                                color: MyTheme
                                                                    .white)),
                                                        endChild: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child: Text.rich(
                                                            TextSpan(
                                                                text:
                                                                    "Flutter Developer, Part-Time, Hyper",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: MyTheme
                                                                        .brownTrunk,
                                                                    fontSize:
                                                                        16),
                                                                children: [
                                                                  TextSpan(
                                                                      text:
                                                                          "\n Aug 2018 - May 2020",
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .normal,
                                                                          color: MyTheme
                                                                              .text,
                                                                          fontSize:
                                                                              12)),
                                                                ]),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10.0),
                                                    child: SizedBox(
                                                      height: 90,
                                                      child: TimelineTile(
                                                        alignment:
                                                            TimelineAlign.start,
                                                        afterLineStyle:
                                                            LineStyle(
                                                                color: MyTheme
                                                                    .greenDark),
                                                        beforeLineStyle:
                                                            LineStyle(
                                                                color: MyTheme
                                                                    .greenDark),
                                                        indicatorStyle: IndicatorStyle(
                                                            color: MyTheme
                                                                .brownTrunk,
                                                            iconStyle: IconStyle(
                                                                iconData: Icons
                                                                    .star_border_sharp,
                                                                color: MyTheme
                                                                    .white)),
                                                        endChild: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child: Text.rich(
                                                            TextSpan(
                                                                text:
                                                                    "Flutter Developer, Intern, Specso Technologies",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: MyTheme
                                                                        .brownTrunk,
                                                                    fontSize:
                                                                        16),
                                                                children: [
                                                                  TextSpan(
                                                                      text:
                                                                          "\n Jul 2020 - Aug 2021",
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .normal,
                                                                          color: MyTheme
                                                                              .text,
                                                                          fontSize:
                                                                              12)),
                                                                ]),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10.0),
                                                    child: SizedBox(
                                                      height: 70,
                                                      child: TimelineTile(
                                                        alignment:
                                                            TimelineAlign.start,
                                                        isLast: true,
                                                        beforeLineStyle:
                                                            LineStyle(
                                                                color: MyTheme
                                                                    .greenDark),
                                                        indicatorStyle: IndicatorStyle(
                                                            color: MyTheme
                                                                .brownTrunk,
                                                            iconStyle: IconStyle(
                                                                iconData: Icons
                                                                    .star_border_sharp,
                                                                color: MyTheme
                                                                    .white)),
                                                        endChild: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child: Text.rich(
                                                            TextSpan(
                                                                text:
                                                                    "Software Developer, Intern, WeExpan Pvt. Ltd.",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: MyTheme
                                                                        .brownTrunk,
                                                                    fontSize:
                                                                        16),
                                                                children: [
                                                                  TextSpan(
                                                                      text:
                                                                          "\n Nov 2020 - Jan 2021",
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .normal,
                                                                          color: MyTheme
                                                                              .text,
                                                                          fontSize:
                                                                              12)),
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
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: AnimatedContainer(
                                            duration:
                                                _pointFourController.duration!,
                                            transform:
                                                Matrix4.translationValues(
                                                    _pointFourTranslation.value,
                                                    0,
                                                    0),
                                            decoration: BoxDecoration(
                                              color: point4Hover
                                                  ? MyTheme.greenBush
                                                  : MyTheme
                                                      .greenBushWithOpacity,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            alignment: Alignment.centerLeft,
                                            padding: const EdgeInsets.all(10),
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                  sigmaY: 5, sigmaX: 5),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10.0),
                                                    child: SizedBox(
                                                      height: 70,
                                                      child: TimelineTile(
                                                        alignment:
                                                            TimelineAlign.start,
                                                        isFirst: true,
                                                        afterLineStyle:
                                                            LineStyle(
                                                                color: MyTheme
                                                                    .greenDark),
                                                        indicatorStyle: IndicatorStyle(
                                                            color: MyTheme
                                                                .brownTrunk,
                                                            iconStyle: IconStyle(
                                                                iconData: Icons
                                                                    .star_border_sharp,
                                                                color: MyTheme
                                                                    .white)),
                                                        endChild: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child: Text.rich(
                                                            TextSpan(
                                                                text:
                                                                    "Associate Software Engineer",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: MyTheme
                                                                        .brownTrunk,
                                                                    fontSize:
                                                                        16),
                                                                children: [
                                                                  TextSpan(
                                                                      text:
                                                                          "\n Betaflux Pvt. Ltd., Bangalore, India\n May 2021 - May 2022",
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .normal,
                                                                          color: MyTheme
                                                                              .text,
                                                                          fontSize:
                                                                              12)),
                                                                ]),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10.0),
                                                    child: SizedBox(
                                                      height: 70,
                                                      child: TimelineTile(
                                                        alignment:
                                                            TimelineAlign.start,
                                                        isLast: true,
                                                        beforeLineStyle:
                                                            LineStyle(
                                                                color: MyTheme
                                                                    .greenDark),
                                                        indicatorStyle: IndicatorStyle(
                                                            color: MyTheme
                                                                .brownTrunk,
                                                            iconStyle: IconStyle(
                                                                iconData: Icons
                                                                    .star_border_sharp,
                                                                color: MyTheme
                                                                    .white)),
                                                        endChild: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child: Text.rich(
                                                            TextSpan(
                                                                text:
                                                                    "Sr. Associate Software Engineer",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: MyTheme
                                                                        .brownTrunk,
                                                                    fontSize:
                                                                        16),
                                                                children: [
                                                                  TextSpan(
                                                                      text:
                                                                          "\n Betaflux Pvt. Ltd., Bangalore, India\n May 2022 - Feb 2023",
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .normal,
                                                                          color: MyTheme
                                                                              .text,
                                                                          fontSize:
                                                                              12)),
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
                                  ),
                                ),
                                AnimatedOpacity(
                                  duration: _pointFiveController.duration!,
                                  opacity: _pointFiveController.value,
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
                                            point5Hover = true;
                                          });
                                        }
                                      },
                                      onExit: (p) {
                                        if (mounted) {
                                          setState(() {
                                            point5Hover = false;
                                          });
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: AnimatedContainer(
                                            duration:
                                                _pointFiveController.duration!,
                                            transform:
                                                Matrix4.translationValues(
                                                    _pointFiveController.value,
                                                    0,
                                                    0),
                                            decoration: BoxDecoration(
                                              color: point5Hover
                                                  ? MyTheme.greenBush
                                                  : MyTheme
                                                      .greenBushWithOpacity,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            alignment: Alignment.centerLeft,
                                            padding: const EdgeInsets.all(10),
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                  sigmaY: 5, sigmaX: 5),
                                              child: const Text.rich(
                                                TextSpan(
                                                    text:
                                                        "Post Graduate Diploma, Mobile Solutions Development",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            MyTheme.brownTrunk,
                                                        fontSize: 16),
                                                    children: [
                                                      TextSpan(
                                                          text:
                                                              "\n Conestoga College, Waterloo, Ontario, Canada\n Sept 2022 - Dec 2023",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color:
                                                                  MyTheme.text,
                                                              fontSize: 12)),
                                                    ]),
                                              ),
                                            ),
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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    highlightColor: MyTheme.greenBush,
                    hoverColor: MyTheme.greenBushWithOpacity,
                    borderRadius: BorderRadius.circular(10),
                    onTap: () async {
                      if (await canLaunchUrl(MyURLs.resume)) {
                        launchUrl(MyURLs.resume);
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Looking for more? Checkout my résumé.",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            height: 1.5,
                            color: MyTheme.brownTrunk,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
