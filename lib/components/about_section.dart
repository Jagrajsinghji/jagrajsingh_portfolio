import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../utils/my_theme.dart';

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
    return VisibilityDetector(
      key: const Key("About Section"),
      onVisibilityChanged: (s) {
        if (s.visibleFraction > .3) {
          forwardAnimation();
        }
      },
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: SizedBox(
              width: size.width * .4,
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
                      height: 20,
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
                              "I'm Jagraj Singh, a scholar having $myAge years of life experience.",
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  height: 1.5,
                                  fontStyle: FontStyle.italic,
                                  color: MyTheme.pinkDark,
                                  fontSize: 18),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.0),
                              child: Text(
                                "I create algorithms in the same way that I write poetry; both have an influence on me.",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    height: 1.5,
                                    fontStyle: FontStyle.italic,
                                    color: MyTheme.pinkDark,
                                    fontSize: 18),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.0),
                              child: Text(
                                "I design and create software with the broader picture in mind, and I feel that's the crux.",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    height: 1.5,
                                    fontStyle: FontStyle.italic,
                                    color: MyTheme.pinkDark,
                                    fontSize: 18),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.0),
                              child: Text(
                                "Although I am passionate about programming, I also have a soft spot for IoT (Internet of Things) and 3D printing.",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    height: 1.5,
                                    fontStyle: FontStyle.italic,
                                    color: MyTheme.pinkDark,
                                    fontSize: 18),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Text(
                                "Let me now take you on a tour through my life.",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    height: 1.5,
                                    fontStyle: FontStyle.italic,
                                    color: MyTheme.pinkDark,
                                    fontSize: 18),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                // print("sds");
                              },
                              child: const Text(
                                "(Let's connect for a comprehensive walk)",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    height: 1.5,
                                    fontStyle: FontStyle.italic,
                                    color: MyTheme.pinkDark,
                                    fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
          LottieBuilder.asset(
            "assets/what_stand_me_out.json",
            width: size.width * .4,
            height: size.width * .4,
          )
        ],
      ),
    );
  }
}
/*
 Writing algorithm is very similar to writing poetry for me in that both have an impact. I design and create software with the broader picture in mind, and I feel that's the key. Although I am passionate about programming, I also have a soft spot for IoT (Internet of Things) and 3D printing. Let me now take you on a tour through my life. (Let's connect for a comprehensive walk)
 */
