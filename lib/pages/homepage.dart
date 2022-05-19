import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jagrajsingh_portfolio/components/companies/companies_section.dart';
import 'package:jagrajsingh_portfolio/components/home_section.dart';
import 'package:jagrajsingh_portfolio/utils/my_theme.dart';

import '../components/about_section.dart';
import '../components/footer.dart';
import '../components/journey_section.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _IndexState();
}

class _IndexState extends State<Homepage> {
  final ScrollController _scrollController = ScrollController();
  ValueNotifier<Color> topBarColor =
      ValueNotifier(MyTheme.nameText.withOpacity(.6));

  StreamSubscription? sectionsVisibilitySubscription;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      double extent = _scrollController.position.pixels;
      Color color = MyTheme.nameText.withOpacity(.6);
      if (extent > 1900) {
        color = MyTheme.nameText.withOpacity(.6);
      }else
      if (extent > 1200) {
        color = MyTheme.greenBush.withOpacity(.6);
      } else if (extent > 560) {
        color = MyTheme.maroon.withOpacity(.6);
      }
      topBarColor.value = color;
    });
  }

  @override
  void dispose() {
    sectionsVisibilitySubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: MyTheme.primary,
            child: Scrollbar(
              controller: _scrollController,
              radius: const Radius.circular(5),
              child: CustomScrollView(
                  shrinkWrap: true,
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverList(
                        delegate: SliverChildListDelegate([
                      const SizedBox(
                        height: 100,
                      ),
                      const HomeSection(),
                      const AboutSection(),
                      const SizedBox(
                        height: 70,
                      ),
                      const JourneySection(),
                      const SizedBox(
                        height: 50,
                      ),
                      const CompaniesSection(),
                      const SizedBox(
                        height: 100,
                      ),
                      const Footer()
                    ])),
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: ValueListenableBuilder<Color>(
                  builder: (c, color, child) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(color: color),
                      height: 100,
                      child: child,
                    );
                  },
                  valueListenable: topBarColor,
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
                        // Expanded(
                        //   child: ListView(
                        //     shrinkWrap: true,
                        //     scrollDirection: Axis.horizontal,
                        //     children: [
                        //       TextButton(
                        //         onPressed: () {},
                        //         child: const Text(
                        //           "Home",
                        //           style: TextStyle(color: MyTheme.text),
                        //         ),
                        //         style: ElevatedButton.styleFrom().copyWith(
                        //           foregroundColor: MaterialStateProperty.all(
                        //               Colors.transparent),
                        //           overlayColor: MaterialStateProperty.all(
                        //               Colors.transparent),
                        //           backgroundColor: MaterialStateProperty.all(
                        //               Colors.transparent),
                        //           shadowColor: MaterialStateProperty.all(
                        //               Colors.transparent),
                        //         ),
                        //       ),
                        //       TextButton(
                        //         onPressed: () {},
                        //         child: const Text(
                        //           "Home",
                        //           style: TextStyle(color: MyTheme.text),
                        //         ),
                        //         style: ElevatedButton.styleFrom().copyWith(
                        //           foregroundColor: MaterialStateProperty.all(
                        //               Colors.transparent),
                        //           overlayColor: MaterialStateProperty.all(
                        //               Colors.transparent),
                        //           backgroundColor: MaterialStateProperty.all(
                        //               Colors.transparent),
                        //           shadowColor: MaterialStateProperty.all(
                        //               Colors.transparent),
                        //         ),
                        //       ),
                        //       TextButton(
                        //         onPressed: () {},
                        //         child: const Text(
                        //           "Home",
                        //           style: TextStyle(color: MyTheme.text),
                        //         ),
                        //         style: ElevatedButton.styleFrom().copyWith(
                        //           foregroundColor: MaterialStateProperty.all(
                        //               Colors.transparent),
                        //           overlayColor: MaterialStateProperty.all(
                        //               Colors.transparent),
                        //           backgroundColor: MaterialStateProperty.all(
                        //               Colors.transparent),
                        //           shadowColor: MaterialStateProperty.all(
                        //               Colors.transparent),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // )
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
