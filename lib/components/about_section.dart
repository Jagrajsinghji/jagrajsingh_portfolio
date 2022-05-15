import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        vsync: this, duration: const Duration(milliseconds: 500));
    _subTitleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

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
    _titleController.forward();
    Timer(const Duration(milliseconds: 500), () {
      _subTitleController.forward();
    });
  }

  void reverseAnimation() {
    _titleController.reverse();
    Timer(const Duration(milliseconds: 500), () {
      _subTitleController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return VisibilityDetector(
      key: const Key("About Section"),
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
                        child: Text(
                          "About",
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
                    AnimatedOpacity(
                      duration: _subTitleController.duration!,
                      opacity: _subTitleController.value,
                      child: AnimatedContainer(
                        transform: Matrix4.translationValues(
                            _subTitleTranslation.value, 0, 0),
                        duration: _subTitleController.duration!,
                        child: Text(
                          "I am Jagraj Singh, a knowledge seeker \nwith $myAge years of experience in life."
                          "\nI develop softwares and provide \nsolutions to the problems."
                          "\nAnd not just the softwares, \nI also love the world of IoT (Internet of Things).",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                              color: MyTheme.text,
                              fontSize: 20),
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
