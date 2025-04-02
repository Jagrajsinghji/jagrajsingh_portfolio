import 'package:flutter/material.dart';
import 'package:jagrajsingh_portfolio/components/drop_down_menu.dart';
import 'package:jagrajsingh_portfolio/components/footer.dart';
import 'package:jagrajsingh_portfolio/components/header.dart';
import 'package:jagrajsingh_portfolio/sections/home/home_section.dart';
import 'package:jagrajsingh_portfolio/sections/journey/journey_section.dart';
import 'package:jagrajsingh_portfolio/sections/organizations/companies_section.dart';
import 'package:jagrajsingh_portfolio/sections/projects/projects_section.dart';
import 'package:jagrajsingh_portfolio/sections/skills/skills_section.dart';
import 'package:jagrajsingh_portfolio/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _IndexState();
}

class _IndexState extends State<Homepage> {
  final ScrollController _scrollController = ScrollController();

  // Create Global Keys for sections
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _journeyKey = GlobalKey();
  final GlobalKey _orgKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectKey = GlobalKey();

  final ValueNotifier<num> _scrollPosition = ValueNotifier(0);

  @override
  void initState() {
    _scrollController.addListener(() {
      _scrollPosition.value = _scrollController.offset;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = context.watch<ThemeProvider>();
    return Scaffold(
      body: Stack(
        children: [
          ValueListenableBuilder<num>(
              valueListenable: _scrollPosition,
              builder: (context, value, _) {
                double rotationAngle = value % 1200;
                double normalizedRotation = (rotationAngle / 1200) * 360;
                return AnimatedContainer(
                  duration: Duration(milliseconds: 10),
                  curve: Curves.easeInCubic,
                  decoration: BoxDecoration(
                      gradient: themeProvider.homeGradient(normalizedRotation)),
                );
              }),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Header(
                mobileHeadingWidget: DynamicSectionSelector(
                  sections: {
                    "Home": _homeKey,
                    "Journey": _journeyKey,
                    "Organizations": _orgKey,
                    "Skills": _skillsKey,
                    "Projects": _projectKey
                  },
                  scrollController: _scrollController,
                ),
                onHeadingClick: (heading) {
                  GlobalKey key = _homeKey;
                  switch (heading) {
                    case "Home":
                      key = _homeKey;
                      break;
                    case "Journey":
                      key = _journeyKey;
                      break;
                    case "Organizations":
                      key = _orgKey;
                      break;
                    case "Projects":
                      key = _projectKey;
                      break;
                    case "Skills":
                      key = _skillsKey;
                      break;
                  }
                  if (key.currentContext != null) {
                    Scrollable.ensureVisible(key.currentContext!,
                        curve: Curves.fastOutSlowIn,
                        duration: Duration(seconds: 1));
                  }
                },
              ),
              Expanded(
                  child: ListView(
                controller: _scrollController,
                cacheExtent: 5000,
                physics: const BouncingScrollPhysics(),
                children: [
                  HomeSection(
                    key: _homeKey,
                  ),
                  JourneySection(
                    key: _journeyKey,
                  ),
                  CompaniesSection(
                    key: _orgKey,
                  ),
                  SkillsSection(key: _skillsKey),
                  ProjectsSection(
                    key: _projectKey,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Footer()
                ],
              )),
            ],
          ),
        ],
      ),
    );
  }
}
