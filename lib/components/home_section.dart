import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/my_theme.dart';

class HomeSection extends StatefulWidget {
  const HomeSection({Key? key}) : super(key: key);

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection>
    with TickerProviderStateMixin {
  late AnimationController _greetingController;
  late AnimationController _titleController;
  late AnimationController _subTitleController;
  late AnimationController _buttonController;
  late Animation<double> _titleTranslation,
      _subTitleTranslation,
      _greetingTranslation;

  @override
  void initState() {
    super.initState();
    _greetingController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _titleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _subTitleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _buttonController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    _greetingTranslation = Tween(begin: 100.0, end: 0.0).animate(
        CurvedAnimation(
            parent: _greetingController, curve: Curves.bounceInOut));

    _titleTranslation = Tween(begin: 100.0, end: 0.0).animate(
        CurvedAnimation(parent: _titleController, curve: Curves.bounceInOut));

    _subTitleTranslation = Tween(begin: 100.0, end: 0.0).animate(
        CurvedAnimation(
            parent: _subTitleController, curve: Curves.bounceInOut));

    _greetingController.forward();
    _greetingController.addListener(() {
      if (mounted) setState(() {});
    });
    Timer(const Duration(milliseconds: 500), () {
      _titleController.forward();
      _titleController.addListener(() {
        if (mounted) setState(() {});
      });
      Timer(const Duration(milliseconds: 500), () {
        _subTitleController.forward();
        _subTitleController.addListener(() {
          if (mounted) setState(() {});
        });
        Timer(const Duration(milliseconds: 800), () {
          _buttonController.forward();
          _buttonController.addListener(() {
            if (mounted) setState(() {});
          });
        });
      });
    });
  }

  @override
  void dispose() {
    _greetingController.dispose();
    _titleController.dispose();
    _subTitleController.dispose();
    _buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      runAlignment: WrapAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Image.asset(
            "assets/laptop_wave.png",
            width: size.width * .4,
            height: size.width * .4,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
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
                  child: const Text(
                    "HEY THERE 👋 I'M",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: MyTheme.text,
                    ),
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: _titleController.duration!,
                opacity: _titleController.value,
                child: AnimatedContainer(
                  transform:
                      Matrix4.translationValues(_titleTranslation.value, 0, 0),
                  duration: _titleController.duration!,
                  child: const Text(
                    "Jagraj Singh",
                    textAlign: TextAlign.center,
                    style: TextStyle(
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
                  child: const Text(
                    "Not a Regular Engineer",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: MyTheme.text,
                        fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              AnimatedOpacity(
                duration: _buttonController.duration!,
                opacity: _buttonController.value,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("What stands me out?",
                      style: TextStyle(fontSize: 16, color: MyTheme.text)),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.hovered)) {
                          return MyTheme.accent;
                        }
                        return MyTheme.button;
                      }),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(18)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
