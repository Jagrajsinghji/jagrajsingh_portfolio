import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../utils/my_theme.dart';
import 'betaflux_container.dart';
import 'hyper_container.dart';
import 'specso_container.dart';
import 'weexpan_container.dart';

class CompaniesSection extends StatefulWidget {
  const CompaniesSection({Key? key}) : super(key: key);

  @override
  State<CompaniesSection> createState() => _CompaniesSectionState();
}

class _CompaniesSectionState extends State<CompaniesSection>
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
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key("Companies Section"),
      onVisibilityChanged: (s) {
        if (s.visibleFraction > .4) {
          forwardAnimation();
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0, bottom: 40),
            child: Text.rich(
              TextSpan(text: "Organizations", children: [
                TextSpan(
                  text: "\nwho helped me reach here",
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
          SizedBox(
            height: 300,
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: const [
                HyperContainer(),
                SpecsoContainer(),
                WeExpanContainer(),
                BetafluxContainer()
              ],
            ),
          )
        ],
      ),
    );
  }
}
