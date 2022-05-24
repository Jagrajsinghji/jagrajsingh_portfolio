import 'package:flutter/material.dart';
import 'package:jagrajsingh_portfolio/components/companies_section.dart';
import 'package:jagrajsingh_portfolio/components/home_section.dart';

import '../components/about_section.dart';
import '../components/footer.dart';
import '../components/header.dart';
import '../components/journey_section.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _IndexState();
}

class _IndexState extends State<Homepage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Header(),
          Expanded(
            child: CustomScrollView(
                shrinkWrap: true,
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverList(
                      delegate: SliverChildListDelegate(
                    [
                      const HomeSection(),
                      const AboutSection(),
                      const JourneySection(),
                      const CompaniesSection(),
                    ],
                  )),
                ]),
          ),
        ],
      ),
    );
  }
}
