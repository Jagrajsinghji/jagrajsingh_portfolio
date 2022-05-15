import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jagrajsingh_portfolio/utils/my_theme.dart';

import '../components/about_section.dart';
import '../components/home_section.dart';
import '../components/journey_section.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _IndexState();
}

class _IndexState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: MyTheme.primary,
            child: Scrollbar(
              radius: const Radius.circular(5),
              child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: const [
                    SizedBox(
                      height: 100,
                    ),
                    HomeSection(),
                    AboutSection(),
                    JourneySection(),
                    SizedBox(
                      height: 100,
                    ),
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  decoration: BoxDecoration(color: MyTheme.accent),
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/sikh_icon.png",
                          height: 60,
                          width: 60,
                          color: MyTheme.text,
                        ),
                        const Spacer(),
                        Expanded(
                          child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Home",
                                  style: TextStyle(color: MyTheme.text),
                                ),
                                style: ElevatedButton.styleFrom().copyWith(
                                  foregroundColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  overlayColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  shadowColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Home",
                                  style: TextStyle(color: MyTheme.text),
                                ),
                                style: ElevatedButton.styleFrom().copyWith(
                                  foregroundColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  overlayColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  shadowColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Home",
                                  style: TextStyle(color: MyTheme.text),
                                ),
                                style: ElevatedButton.styleFrom().copyWith(
                                  foregroundColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  overlayColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  shadowColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
