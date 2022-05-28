import 'dart:async';

import 'package:flutter/material.dart';

import '../utils/my_theme.dart';

class HomeSection extends StatefulWidget {
  const HomeSection({Key? key}) : super(key: key);

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> with TickerProviderStateMixin {
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

    if (mounted) _greetingController.forward();
    _greetingController.addListener(() {
      if (mounted) setState(() {});
    });
    Timer(const Duration(milliseconds: 500), () {
      if (mounted) _titleController.forward();
      _titleController.addListener(() {
        if (mounted) setState(() {});
      });
      Timer(const Duration(milliseconds: 500), () {
        if (mounted) _subTitleController.forward();
        _subTitleController.addListener(() {
          if (mounted) setState(() {});
        });
        Timer(const Duration(milliseconds: 800), () {
          if (mounted) _buttonController.forward();
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
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(colors: [
            MyTheme.greenBushWithOpacity.withOpacity(.2),
            MyTheme.whatStandButton.withOpacity(.5),
            MyTheme.smoke
          ], stops: const [
            .2,
            .4,
            .9
          ])),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: ClipRRect(borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                "assets/my_pic.png",
                width: 200,
                height: 200,fit: BoxFit.cover,
              ),
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
                    transform: Matrix4.translationValues(
                        _titleTranslation.value, 0, 0),
                    duration: _titleController.duration!,
                    child: const Text(
                      "Jagraj Singh",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: MyTheme.nameText,
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
                          color: MyTheme.nameText,
                          fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                // AnimatedOpacity(
                //   duration: _buttonController.duration!,
                //   opacity: _buttonController.value,
                //   child: ElevatedButton(
                //     onPressed: () {},
                //     child: const Text("What stands me out?",
                //         style: TextStyle(fontSize: 16)),
                //     style: ButtonStyle(
                //         backgroundColor:
                //             MaterialStateProperty.resolveWith((states) {
                //           if (states.contains(MaterialState.hovered)) {
                //             return MyTheme.nameText;
                //           }
                //           return MyTheme.whatStandButton;
                //         }),
                //         foregroundColor:
                //             MaterialStateProperty.resolveWith((states) {
                //           if (states.contains(MaterialState.hovered)) {
                //             return MyTheme.whatStandButton;
                //           }
                //           return MyTheme.nameText;
                //         }),
                //         padding:
                //             MaterialStateProperty.all(const EdgeInsets.all(18)),
                //         shape: MaterialStateProperty.all(RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(10)))),
                //   ),
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
