import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../utils/my_theme.dart';

class ProjectSection extends StatefulWidget {
  const ProjectSection({Key? key}) : super(key: key);

  @override
  State<ProjectSection> createState() => _ProjectSectionState();
}

class _ProjectSectionState extends State<ProjectSection>
    with TickerProviderStateMixin {
  late AnimationController _titleController;
  late Animation<double> _titleTranslation;

  @override
  void initState() {
    super.initState();
    _titleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _titleTranslation = Tween(begin: -100.0, end: 0.0).animate(
        CurvedAnimation(parent: _titleController, curve: Curves.bounceInOut));
    _titleController.addListener(() {
      if (mounted) setState(() {});
    });
  }

  void forwardAnimation() {
    if (!mounted) return;
    _titleController.forward();
    // Timer(const Duration(milliseconds: 500), () {
    //   _subTitleController.forward();
    // });
  }

  void reverseAnimation() {
    if (!mounted) return;
    _titleController.reverse();
    // Timer(const Duration(milliseconds: 500), () {
    //   _subTitleController.reverse();
    // });
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key("Project Section"),
      onVisibilityChanged: (s) {
        if (s.visibleFraction > .4) {
          forwardAnimation();
        } else {
          reverseAnimation();
        }
      },
      child: Column(
        children: [
          AnimatedOpacity(
            duration: _titleController.duration!,
            opacity: _titleController.value,
            child: AnimatedContainer(
              transform:
                  Matrix4.translationValues(_titleTranslation.value, 0, 0),
              duration: _titleController.duration!,
              child: Text.rich(
                TextSpan(text: "Work", children: [
                  TextSpan(
                    text: "\nthat I take pride in.",
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
          SizedBox(
            height: 300,
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: AnimatedOpacity(
                    duration: _titleController.duration!,
                    opacity: _titleController.value,
                    child: AnimatedContainer(
                        width: 300,
                        transform: Matrix4.translationValues(
                            _titleTranslation.value, 0, 0),
                        duration: _titleController.duration!,
                        decoration: BoxDecoration(
                            color: MyTheme.accent,
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset(
                          "assets/urOs.png",
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
