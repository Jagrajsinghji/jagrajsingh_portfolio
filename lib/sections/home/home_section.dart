import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'random_dots_bg.dart';

class HomeSection extends StatefulWidget {
  const HomeSection({super.key});

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection>
    with TickerProviderStateMixin {
  late AnimationController _greetingController;
  late AnimationController _titleController;
  late Animation<double> _titleTranslation, _greetingTranslation;
  late AnimatedTextController _animatedTextController;
  String myAge = (DateTime.now().difference(DateTime(1999, 4, 16)).inDays / 365)
      .floor()
      .toString();

  @override
  void initState() {
    super.initState();
    _greetingController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _titleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    _animatedTextController = AnimatedTextController();
    _animatedTextController.pause();

    _greetingTranslation = Tween(begin: 100.0, end: 0.0).animate(
        CurvedAnimation(
            parent: _greetingController, curve: Curves.bounceInOut));
    _titleTranslation = Tween(begin: 100.0, end: 0.0).animate(
        CurvedAnimation(parent: _titleController, curve: Curves.bounceInOut));

    if (mounted) _greetingController.forward();
    _greetingController.addListener(() {
      if (mounted) setState(() {});
    });

    Timer(const Duration(milliseconds: 500), () {
      if (mounted) _titleController.forward();
      _titleController.addListener(() {
        if (mounted) setState(() {});
        if (_titleController.isCompleted) {
          _animatedTextController.play();
        }
      });
    });
  }

  @override
  void dispose() {
    _greetingController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RandomDotsBg(),
        Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/profile_nobg.png",
                    width: 350,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: SizedBox(
                  width: 500,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedOpacity(
                        duration: _greetingController.duration!,
                        opacity: _greetingController.value,
                        child: AnimatedContainer(
                          transform: Matrix4.translationValues(
                              _greetingTranslation.value, 0, 0),
                          duration: _greetingController.duration!,
                          child: Text(
                            "HEY THERE 👋",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineLarge!,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AnimatedOpacity(
                        duration: _titleController.duration!,
                        opacity: _titleController.value,
                        child: AnimatedContainer(
                          transform: Matrix4.translationValues(
                              _titleTranslation.value, 0, 0),
                          height: 45,
                          width: 400,
                          duration: _titleController.duration!,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("I'm ",
                                  textAlign: TextAlign.center,
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              Text(
                                "Jagraj Singh, ",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                              ),
                              AnimatedTextKit(
                                controller: _animatedTextController,
                                repeatForever: true,
                                stopPauseOnTap: true,
                                animatedTexts: [
                                  RotateAnimatedText('a philosopher',
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .titleLarge!),
                                  RotateAnimatedText('a poet',
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .titleLarge!),
                                  RotateAnimatedText('an innovator',
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .titleLarge!),
                                  RotateAnimatedText('an entrepreneur',
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .titleLarge!),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                        duration: _titleController.duration!,
                        opacity: _titleController.value,
                        child: AnimatedContainer(
                          transform: Matrix4.translationValues(
                              _titleTranslation.value, 0, 0),
                          duration: _titleController.duration!,
                          child: Text(
                            "$myAge years of exploring life, blending philosophy with technology to create meaningful digital experiences",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
