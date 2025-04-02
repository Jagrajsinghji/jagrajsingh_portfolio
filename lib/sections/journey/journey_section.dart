import 'dart:async';
import 'dart:ui';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jagrajsingh_portfolio/utils/painters/sin_wave_painter.dart';
import 'package:lottie/lottie.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../utils/globals.dart';

class JourneySection extends StatefulWidget {
  const JourneySection({super.key});

  @override
  State<JourneySection> createState() => _JourneySectionState();
}

class _JourneySectionState extends State<JourneySection>
    with TickerProviderStateMixin {
  late AnimationController _titleController;
  late AnimationController _point1Controller,
      _point2Controller,
      _point3Controller,
      _point4Controller,
      _point5Controller;
  late Animation<double> _titleTranslation,
      _point1Translation,
      _point2Translation,
      _point3Translation,
      _point4Translation,
      _point5Translation;

  @override
  void initState() {
    super.initState();
    _titleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    _point1Controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _point2Controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _point3Controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _point4Controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _point5Controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    _titleTranslation = Tween(begin: 100.0, end: 0.0).animate(
        CurvedAnimation(parent: _titleController, curve: Curves.bounceInOut));

    _point1Translation = Tween(begin: 100.0, end: 0.0).animate(
        CurvedAnimation(parent: _point1Controller, curve: Curves.bounceInOut));
    _point2Translation = Tween(begin: 100.0, end: 0.0).animate(
        CurvedAnimation(parent: _point2Controller, curve: Curves.bounceInOut));
    _point3Translation = Tween(begin: 100.0, end: 0.0).animate(
        CurvedAnimation(parent: _point3Controller, curve: Curves.bounceInOut));
    _point4Translation = Tween(begin: 100.0, end: 0.0).animate(
        CurvedAnimation(parent: _point4Controller, curve: Curves.bounceInOut));
    _point5Translation = Tween(begin: 100.0, end: 0.0).animate(
        CurvedAnimation(parent: _point5Controller, curve: Curves.bounceInOut));

    _titleController.addListener(() {
      if (mounted) setState(() {});
    });

    _point1Controller.addListener(() {
      if (mounted) setState(() {});
    });
    _point2Controller.addListener(() {
      if (mounted) setState(() {});
    });
    _point3Controller.addListener(() {
      if (mounted) setState(() {});
    });
    _point4Controller.addListener(() {
      if (mounted) setState(() {});
    });
    _point5Controller.addListener(() {
      if (mounted) setState(() {});
    });
    forwardAnimation();
  }

  bool _point1Hover = false,
      _point2Hover = false,
      _point3Hover = false,
      _point4Hover = false,
      _point5Hover = false;

  @override
  void dispose() {
    _titleController.dispose();
    _point1Controller.dispose();
    _point2Controller.dispose();
    _point3Controller.dispose();
    _point4Controller.dispose();
    _point5Controller.dispose();
    super.dispose();
  }

  void forwardAnimation() {
    if (!mounted) return;
    _titleController.forward();
    Timer(const Duration(milliseconds: 100), () {
      if (!mounted) return;
      _point1Controller.forward();
      Timer(const Duration(milliseconds: 100), () {
        if (!mounted) return;
        _point2Controller.forward();
        Timer(const Duration(milliseconds: 100), () {
          if (!mounted) return;
          _point3Controller.forward();
          Timer(const Duration(milliseconds: 100), () {
            if (!mounted) return;
            _point4Controller.forward();
            Timer(const Duration(milliseconds: 100), () {
              if (!mounted) return;
              _point5Controller.forward();
            });
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isMobile = size.width <= 620;
    bool showLottie = browserName != BrowserName.safari &&
        defaultTargetPlatform != TargetPlatform.android &&
        defaultTargetPlatform != TargetPlatform.iOS;

    return CustomPaint(
      painter: SinWavePainter(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          runAlignment: WrapAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: SizedBox(
                width: size.width * (isMobile ? 1 : .5),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //heading
                      buildHeading(context),
                      const SizedBox(
                        height: 20,
                      ),
                      ListView(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          children: [
                            buildTile1(isMobile),
                            buildTile2(isMobile),
                            buildTile3(isMobile),
                            buildTile4(isMobile),
                            buildTile5(isMobile)
                          ]),
                    ]),
              ),
            ),
            if (showLottie && (!isMobile))
              Transform.flip(
                flipX: true,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: LottieBuilder.asset(
                    "assets/journey.json",
                    errorBuilder: (_, __, ___) => Container(),
                    width: size.width * .3,
                    height: size.width * .3,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  AnimatedOpacity buildTile5(bool isMobile) {
    double fontFactor = isMobile ? .8 : 1;
    return AnimatedOpacity(
      duration: _point5Controller.duration!,
      opacity: _point5Controller.value,
      child: TimelineTile(
        alignment: TimelineAlign.start,
        beforeLineStyle: const LineStyle(thickness: 2),
        indicatorStyle:
            IndicatorStyle(iconStyle: IconStyle(iconData: Icons.work_outline)),
        isLast: true,
        endChild: MouseRegion(
          onEnter: (p) => setState(() => _point5Hover = true),
          onExit: (p) => setState(() => _point5Hover = false),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: AnimatedContainer(
              duration: _point5Controller.duration!,
              transform:
                  Matrix4.translationValues(_point5Translation.value, 0, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: _point5Hover
                      ? Theme.of(context).hoverColor
                      : Theme.of(context).cardColor,
                  border: _point5Hover
                      ? Border.all(color: Theme.of(context).cardColor, width: 3)
                      : Border.all(
                          color: Theme.of(context).hoverColor, width: 3)),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(10),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                child: Text.rich(
                  TextSpan(
                      text: "Software Engineer, Contract",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .apply(fontSizeFactor: fontFactor),
                      children: [
                        TextSpan(
                          text:
                              "\n Immortal Ventures, Remote, Canada\n May 2023 - Feb 2024",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .apply(fontSizeFactor: fontFactor),
                        ),
                      ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  AnimatedOpacity buildTile4(bool isMobile) {
    double fontFactor = isMobile ? .8 : 1;
    return AnimatedOpacity(
      duration: _point4Controller.duration!,
      opacity: _point4Controller.value,
      child: TimelineTile(
        alignment: TimelineAlign.start,
        beforeLineStyle: const LineStyle(thickness: 2),
        indicatorStyle:
            IndicatorStyle(iconStyle: IconStyle(iconData: Icons.work_outline)),
        endChild: MouseRegion(
          onEnter: (p) => setState(() => _point4Hover = true),
          onExit: (p) => setState(() => _point4Hover = false),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: AnimatedContainer(
              duration: _point4Controller.duration!,
              transform:
                  Matrix4.translationValues(_point4Translation.value, 0, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: _point4Hover
                      ? Theme.of(context).hoverColor
                      : Theme.of(context).cardColor,
                  border: _point4Hover
                      ? Border.all(color: Theme.of(context).cardColor, width: 3)
                      : Border.all(
                          color: Theme.of(context).hoverColor, width: 3)),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(10),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: SizedBox(
                        height: 80,
                        child: TimelineTile(
                          alignment: TimelineAlign.start,
                          isFirst: true,
                          afterLineStyle: LineStyle(thickness: 2),
                          indicatorStyle: IndicatorStyle(
                              iconStyle: IconStyle(
                            iconData: Icons.work_outline,
                          )),
                          endChild: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text.rich(
                              TextSpan(
                                  text: "Associate Software Engineer (Co-Op)",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .apply(fontSizeFactor: fontFactor),
                                  children: [
                                    TextSpan(
                                      text:
                                          "\n IMS (Insurance & Mobility Solutions), Waterloo, Ontario, Canada\n May 2023 - Aug 2023",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .apply(fontSizeFactor: fontFactor),
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: SizedBox(
                        height: 80,
                        child: TimelineTile(
                          alignment: TimelineAlign.start,
                          isLast: true,
                          beforeLineStyle: LineStyle(thickness: 2),
                          indicatorStyle: IndicatorStyle(
                              iconStyle: IconStyle(
                            iconData: Icons.work_outline,
                          )),
                          endChild: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text.rich(
                              TextSpan(
                                  text: "Associate Software Engineer",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .apply(fontSizeFactor: fontFactor),
                                  children: [
                                    TextSpan(
                                      text:
                                          "\n IMS (Insurance & Mobility Solutions), Waterloo, Ontario, Canada\n Sep 2023 - Feb 2024",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .apply(fontSizeFactor: fontFactor),
                                    )
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
    );
  }

  AnimatedOpacity buildTile3(bool isMobile) {
    double fontFactor = isMobile ? .8 : 1;
    return AnimatedOpacity(
      duration: _point3Controller.duration!,
      opacity: _point3Controller.value,
      child: TimelineTile(
        alignment: TimelineAlign.start,
        beforeLineStyle: const LineStyle(thickness: 2),
        indicatorStyle: IndicatorStyle(
            iconStyle: IconStyle(
          iconData: Icons.work_outline,
        )),
        endChild: MouseRegion(
          onEnter: (p) => setState(() => _point3Hover = true),
          onExit: (p) => setState(() => _point3Hover = false),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: AnimatedContainer(
              duration: _point3Controller.duration!,
              transform:
                  Matrix4.translationValues(_point3Translation.value, 0, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: _point3Hover
                      ? Theme.of(context).hoverColor
                      : Theme.of(context).cardColor,
                  border: _point3Hover
                      ? Border.all(color: Theme.of(context).cardColor, width: 3)
                      : Border.all(
                          color: Theme.of(context).hoverColor, width: 3)),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(10),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                child: Text.rich(
                  TextSpan(
                      text:
                          "Post Graduate Diploma, Mobile Solutions Development",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .apply(fontSizeFactor: fontFactor),
                      children: [
                        TextSpan(
                          text:
                              "\n Conestoga College, Waterloo, Ontario, Canada\n Sep 2022 - Dec 2023",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .apply(fontSizeFactor: fontFactor),
                        ),
                      ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  AnimatedOpacity buildTile2(bool isMobile) {
    double fontFactor = isMobile ? .8 : 1;
    return AnimatedOpacity(
      duration: _point2Controller.duration!,
      opacity: _point2Controller.value,
      child: TimelineTile(
        alignment: TimelineAlign.start,
        beforeLineStyle: const LineStyle(thickness: 2),
        indicatorStyle: IndicatorStyle(
            iconStyle: IconStyle(
          iconData: Icons.work_outline,
        )),
        endChild: MouseRegion(
          onEnter: (p) => setState(() => _point2Hover = true),
          onExit: (p) => setState(() => _point2Hover = false),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: AnimatedContainer(
              duration: _point2Controller.duration!,
              transform:
                  Matrix4.translationValues(_point2Translation.value, 0, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: _point2Hover
                      ? Theme.of(context).hoverColor
                      : Theme.of(context).cardColor,
                  border: _point2Hover
                      ? Border.all(color: Theme.of(context).cardColor, width: 3)
                      : Border.all(
                          color: Theme.of(context).hoverColor, width: 3)),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(10),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: SizedBox(
                        height: 80,
                        child: TimelineTile(
                          alignment: TimelineAlign.start,
                          isFirst: true,
                          afterLineStyle: LineStyle(thickness: 2),
                          indicatorStyle: IndicatorStyle(
                              iconStyle: IconStyle(
                            iconData: Icons.work_outline,
                          )),
                          endChild: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text.rich(
                              TextSpan(
                                  text: "Associate Software Engineer",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .apply(fontSizeFactor: fontFactor),
                                  children: [
                                    TextSpan(
                                      text:
                                          "\n Betaflux Pvt. Ltd., Bangalore, India\n May 2021 - May 2022",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .apply(fontSizeFactor: fontFactor),
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: SizedBox(
                        height: 80,
                        child: TimelineTile(
                          alignment: TimelineAlign.start,
                          isLast: true,
                          beforeLineStyle: LineStyle(thickness: 2),
                          indicatorStyle: IndicatorStyle(
                              iconStyle: IconStyle(
                            iconData: Icons.work_outline,
                          )),
                          endChild: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text.rich(
                              TextSpan(
                                  text: "Sr. Associate Software Engineer",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .apply(fontSizeFactor: fontFactor),
                                  children: [
                                    TextSpan(
                                      text:
                                          "\n Betaflux Pvt. Ltd., Bangalore, India\n May 2022 - June 2023",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .apply(fontSizeFactor: fontFactor),
                                    )
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
    );
  }

  AnimatedOpacity buildTile1(bool isMobile) {
    double height = isMobile ? 70 : 50;
    double fontFactor = isMobile ? .8 : 1;
    return AnimatedOpacity(
      duration: _point1Controller.duration!,
      opacity: _point1Controller.value,
      child: TimelineTile(
        alignment: TimelineAlign.start,
        isFirst: true,
        beforeLineStyle: const LineStyle(thickness: 2),
        indicatorStyle: IndicatorStyle(
            iconStyle: IconStyle(
          iconData: Icons.book_outlined,
        )),
        endChild: MouseRegion(
          onEnter: (p) => setState(() => _point1Hover = true),
          onExit: (p) => setState(() => _point1Hover = false),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: AnimatedContainer(
              duration: _point1Controller.duration!,
              transform:
                  Matrix4.translationValues(_point1Translation.value, 0, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: _point1Hover
                      ? Theme.of(context).hoverColor
                      : Theme.of(context).cardColor,
                  border: _point1Hover
                      ? Border.all(color: Theme.of(context).cardColor, width: 3)
                      : Border.all(
                          color: Theme.of(context).hoverColor, width: 3)),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(10),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text.rich(
                      TextSpan(
                          text:
                              "Bachelors of Technology, Computer Science Engineering",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .apply(fontSizeFactor: fontFactor),
                          children: [
                            TextSpan(
                              text:
                                  "\nGuru Gobind Singh IndraPrastha University, India\nAug 2017 - Jul 2021",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .apply(fontSizeFactor: fontFactor),
                            ),
                          ]),
                    ),
                    ExpansionTile(
                      shape: LinearBorder.none,
                      collapsedShape: LinearBorder.none,
                      title: Text(
                        "Professional Experience",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .apply(fontSizeFactor: fontFactor),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: SizedBox(
                            height: height,
                            child: TimelineTile(
                              alignment: TimelineAlign.start,
                              isFirst: true,
                              afterLineStyle: LineStyle(thickness: 2),
                              indicatorStyle: IndicatorStyle(
                                  iconStyle: IconStyle(
                                iconData: Icons.work_outline,
                              )),
                              endChild: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, left: 10.0, right: 10.0),
                                child: Text.rich(
                                  TextSpan(
                                      text:
                                          "Application Developer, Part-Time, Hyper",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .apply(fontSizeFactor: fontFactor),
                                      children: [
                                        TextSpan(
                                          text: "\n Aug 2018 - Jan 2019",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .apply(
                                                  fontSizeFactor: fontFactor),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: SizedBox(
                            height: height,
                            child: TimelineTile(
                              alignment: TimelineAlign.start,
                              afterLineStyle: LineStyle(thickness: 2),
                              beforeLineStyle: LineStyle(thickness: 2),
                              indicatorStyle: IndicatorStyle(
                                  iconStyle: IconStyle(
                                iconData: Icons.work_outline,
                              )),
                              endChild: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text.rich(
                                  TextSpan(
                                      text:
                                          "Summer Intern - Flutter, Matra Ventures LLP | Hyper",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .apply(fontSizeFactor: fontFactor),
                                      children: [
                                        TextSpan(
                                          text: "\n Jul 2019 - Jul 2019",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .apply(
                                                  fontSizeFactor: fontFactor),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: SizedBox(
                            height: height,
                            child: TimelineTile(
                              alignment: TimelineAlign.start,
                              afterLineStyle: LineStyle(thickness: 2),
                              beforeLineStyle: LineStyle(thickness: 2),
                              indicatorStyle: IndicatorStyle(
                                  iconStyle: IconStyle(
                                iconData: Icons.work_outline,
                              )),
                              endChild: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text.rich(
                                  TextSpan(
                                      text:
                                          "Software Developer, Part-Time, WeOtto",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .apply(fontSizeFactor: fontFactor),
                                      children: [
                                        TextSpan(
                                          text: "\n Nov 2019 - May 2020",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .apply(
                                                  fontSizeFactor: fontFactor),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: SizedBox(
                            height: height,
                            child: TimelineTile(
                              alignment: TimelineAlign.start,
                              afterLineStyle: LineStyle(thickness: 2),
                              beforeLineStyle: LineStyle(thickness: 2),
                              indicatorStyle: IndicatorStyle(
                                  iconStyle: IconStyle(
                                iconData: Icons.work_outline,
                              )),
                              endChild: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text.rich(
                                  TextSpan(
                                      text:
                                          "Application Developer - Flutter, Intern, Specso Technologies",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .apply(fontSizeFactor: fontFactor),
                                      children: [
                                        TextSpan(
                                          text: "\n Jul 2020 - Aug 2020",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .apply(
                                                  fontSizeFactor: fontFactor),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: SizedBox(
                            height: height,
                            child: TimelineTile(
                              alignment: TimelineAlign.start,
                              isLast: true,
                              beforeLineStyle: LineStyle(thickness: 2),
                              indicatorStyle: IndicatorStyle(
                                  iconStyle: IconStyle(
                                iconData: Icons.work_outline,
                              )),
                              endChild: Padding(
                                padding: EdgeInsets.only(
                                    left: 10.0, right: 10.0, bottom: 10),
                                child: Text.rich(
                                  TextSpan(
                                      text:
                                          "Application Developer - Flutter, Intern, WeExpan Pvt. Ltd.",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .apply(fontSizeFactor: fontFactor),
                                      children: [
                                        TextSpan(
                                          text: "\n Nov 2020 - Jan 2021",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .apply(
                                                  fontSizeFactor: fontFactor),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  AnimatedOpacity buildHeading(BuildContext context) {
    return AnimatedOpacity(
      duration: _titleController.duration!,
      opacity: _titleController.value,
      child: AnimatedContainer(
        transform: Matrix4.translationValues(_titleTranslation.value, 0, 0),
        duration: _titleController.duration!,
        child: Text.rich(
            TextSpan(text: "JOURNEY", children: [
              TextSpan(
                  text: "\nover destination",
                  style: Theme.of(context).textTheme.headlineSmall!)
            ]),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge!),
      ),
    );
  }
}
